import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:jawla/core/classes/status.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/core/functions/paymob_payment/pay_with_card.dart';
import 'package:jawla/core/functions/paymob_payment/pay_with_refcode.dart';
import 'package:jawla/core/functions/paymob_payment/pay_with_wallet.dart';
import 'package:jawla/core/functions/paypal_payment/pay_with_paypal.dart';
import 'package:jawla/data/reservation/payment_request.dart';
import 'package:jawla/data/reservation/reservation_request.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view/widgets/warning_widget.dart';

class PaymentMethodCubit extends Cubit<AppState> {
  PaymentMethodCubit() : super(Initial());

  var persons = Get.arguments['persons'];
  var mainImage = Get.arguments['mainImage'];
  var totalPrice = Get.arguments['totalPrice'];
  var price = Get.arguments['price'];
  var tripId = Get.arguments['tripId'];
  String response = "";

  TextEditingController walletCont = TextEditingController();

  goToSuccessPage() {
    Get.toNamed(AppRoutes().successPage);
  }

  setInitialState() {
    emit(Initial());
  }

  payWithCard(BuildContext context) async {
    emit(Loading());
    try {
      await paymobPayWithCard(
        context,
        totalPrice is double ? totalPrice : double.parse(totalPrice.toString()),
        this,
      );
    } catch (e) {
      Get.snackbar("Failed", "There's Something Wrong",
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: Colors.white);
    }
  }

  payWithWallet(BuildContext context, String walletNumber) async {
    emit(Loading());
    try {
      Get.back();
      await paymobPayWithWallet(
          context,
          totalPrice is double
              ? totalPrice
              : double.parse(totalPrice.toString()),
          walletNumber,
          this);
    } catch (e) {
      Get.snackbar("Failed", "There's Something Wrong",
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: Colors.white);
    }
  }

  payWithPaypalFun(BuildContext context) {
    emit(Loading());
    payWithPaypal(
      context,
      this,
      totalPrice.toString(),
    );
  }

  payWithRefCodeFun() async {
    emit(Loading());
    response = await PayWithRefCodeClass().payWithRefCode(
      int.parse(totalPrice.toString()),
    );
    if (response != "") {
      emit(Success([]));
      Get.toNamed(AppRoutes().refCode,
          arguments: {"controller": this, "response": response});
    } else {
      emit(ServerError());
    }
  }

  completePayment() async {
    emit(Loading());
    Either<Status, Map> response = await paymentRequest(persons, tripId);

    response.fold((l) {
      if (l.type == StatusType.internetFailure) {
        emit(InternetError());
      } else if (l.type == StatusType.serverFailure) {
        emit(ServerError());
      } else if (l.type == StatusType.apiFailure) {
        emit(ApiFailure(l.errorData['errors']));
        warningWidget("Failed", Icons.error, "${l.errorData['errors']}");
      }
    }, (r) {

      completeReservation(r['id']);
    });
  }

  completeReservation(
    paymentId,
  ) async {

    var response = await reservationReq(paymentId, tripId);
    response.fold((l) {
      if (l.type == StatusType.internetFailure) {
        emit(InternetError());
      } else if (l.type == StatusType.serverFailure) {
        emit(ServerError());
      } else if (l.type == StatusType.apiFailure) {
        emit(ApiFailure(l.errorData['errors']));
        warningWidget("Failed", Icons.error, "${l.errorData['errors']}");
      }
    }, (r) {
      Get.toNamed(AppRoutes().successPage);
      emit(Success([]));
    });
  }
}
