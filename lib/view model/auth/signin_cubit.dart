import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/view%20model/app_state.dart';

class SignInCubit extends Cubit<AppState> {
  SignInCubit() : super(Initial());

  bool securepassword = false;
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  TextEditingController userNameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  goToSignup() {
    Get.offAllNamed(AppRoutes().signUp);
  }

  goToForgetPassword() {
    Get.toNamed(AppRoutes().forgetPassword);
  }

  changeSecure() {
    securepassword = !securepassword;
    emit(Initial());
  }

  goToHomePage() {
    Get.offAllNamed(AppRoutes().bottomNav);
  }
}
