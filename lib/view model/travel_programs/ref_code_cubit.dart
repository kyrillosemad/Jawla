// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/travel_programs/payment_method_cubit.dart';
import '../../core/functions/paymob_payment/pay_with_refcode.dart';

class RefCodeCubit extends Cubit<AppState> {
  RefCodeCubit() : super(Initial());
  var response = Get.arguments['response'];

  checkPayment(BuildContext context) async {
    emit(Loading());
    try {
      var controller = Get.find<PaymentMethodCubit>();
      bool status =
          await PayWithRefCodeClass().checkPaymentStatus(response.toString());
      if (status == true) {
        emit(Success([]));
        controller.completePayment();
      } else {
        emit(Success([]));
        Get.snackbar("Failed", "Payment Not Completed , Try Again",
            backgroundColor: Colors.red.withOpacity(0.5),
            colorText: Colors.white);
        Get.offAllNamed(AppRoutes().homePage);
      }
    } catch (e) {
      emit(ServerError());
      Get.snackbar("Failed", "There's Something Wrong",
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: Colors.white);
      Get.offAllNamed(AppRoutes().homePage);
    }
  }
}
