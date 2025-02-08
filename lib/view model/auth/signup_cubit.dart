import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/view%20model/app_state.dart';

class SignupCubit extends Cubit<AppState> {
  SignupCubit() : super(Initial());
  bool securepassword = false;
  bool secureConfirmedpassword = false;
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  TextEditingController userNameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController confirmPasswordCont = TextEditingController();

  goToSignin() {
    Get.offAllNamed(AppRoutes().signIn);
  }

  changeSecure() {
    securepassword = !securepassword;
    emit(Initial());
  }

  changeConfirmedSecure() {
    secureConfirmedpassword = !secureConfirmedpassword;
    emit(Initial());
  }
}
