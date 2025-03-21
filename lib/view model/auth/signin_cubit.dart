// ignore_for_file: unrelated_type_equality_checks

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/classes/status.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/core/services/services.dart';
import 'package:jawla/data/auth/login_request.dart';
import 'package:jawla/view%20model/app_state.dart';

class SignInCubit extends Cubit<AppState> {
  SignInCubit() : super(Initial());
  final services = Get.put(Services());
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

  loginFun() async {
    emit(Loading());
    Either<Status, Map> response =
        await loginReq(userNameCont.text, passwordCont.text);

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
      print(r['token']);
      services.sharedPref!.setString("userToken", r['token'].toString());
      Get.offAllNamed(AppRoutes().bottomNav);
    });
  }
}
