// ignore_for_file: unrelated_type_equality_checks

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/core/constants/variable.dart';
import 'package:jawla/core/services/services.dart';
import 'package:jawla/data/profile/change_password_request.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view/widgets/success_widget.dart';
import 'package:jawla/view/widgets/warning_widget.dart';
import '../../core/classes/status.dart';

class ChangePasswordCubit extends Cubit<AppState> {
  ChangePasswordCubit() : super(Initial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController confirmPasswordCont = TextEditingController();

  final services = Get.put(Services());

  changePasswordFun() async {
    if (passwordCont.text == confirmPasswordCont.text) {
      emit(Loading());
      Either<Status, Map> response = await changePasswordReq(
          Variable().token.toString(), oldPasswordCont.text, passwordCont.text);
      response.fold((l) {
        if (l.type == StatusType.internetFailure) {
          services.sharedPref!.clear();
          Get.toNamed(AppRoutes().signIn);
          emit(InternetError());
        } else if (l.type == StatusType.serverFailure) {
          services.sharedPref!.clear();
          Get.toNamed(AppRoutes().signIn);
          emit(ServerError());
        } else if (l.type == StatusType.apiFailure) {
          emit(ApiFailure(l.errorData['errors']));
          warningWidget("Failed", Icons.warning, "l.errorData['errors']");
        }
      }, (r) {
        emit(Success([]));
        successWidget("Success", "${r['message']}");
        Get.offAllNamed(AppRoutes().bottomNav);
      });
    } else {
      warningWidget(
          "Wrong", Icons.warning, "The confirm password does not match.");
    }
  }
}
