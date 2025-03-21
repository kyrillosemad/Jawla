import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/core/services/services.dart';
import 'package:jawla/data/auth/signup_requset.dart';
import 'package:jawla/view%20model/app_state.dart';

import '../../core/classes/status.dart';

class SignupCubit extends Cubit<AppState> {
  SignupCubit() : super(Initial());
  bool securepassword = false;
  bool secureConfirmedPassword = false;
  final services = Get.put(Services());
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  TextEditingController userNameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();

  goToSignin() {
    Get.offAllNamed(AppRoutes().signIn);
  }

  changeSecure() {
    securepassword = !securepassword;
    emit(Initial());
  }

  changeConfirmedSecure() {
    secureConfirmedPassword = !secureConfirmedPassword;
    emit(Initial());
  }

  signUpFun() async {
    emit(Loading());
    Either<Status, Map> response = await signupReq(
        userNameCont.text, emailCont.text, phoneCont.text, passwordCont.text);

    response.fold((l) {
      if (l.type == StatusType.internetFailure) {
        emit(InternetError());
      } else if (l.type == StatusType.serverFailure) {
        emit(ServerError());
      } else if (l.type == StatusType.apiFailure) {
        emit(ApiFailure(l.errorData['errors']));
      }
    }, (r) {
      emit(Success(r));
      Get.offAllNamed(AppRoutes().signIn);
      Future.delayed(const Duration(milliseconds: 300), () {
        Get.snackbar(
          "Success 🎉",
          r['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.shade600,
          colorText: Colors.white,
          icon: const Icon(Icons.check_circle, color: Colors.white),
          borderRadius: 12,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 3),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      });
    });
  }
}
