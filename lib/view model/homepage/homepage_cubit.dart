// ignore_for_file: unrelated_type_equality_checks

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/classes/status.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/core/services/services.dart';
import 'package:jawla/data/profile/get_profile_data__request.dart';
import 'package:jawla/view%20model/app_state.dart';

class HomePageCubit extends Cubit<AppState> {
  HomePageCubit() : super(Initial());
  int index = 0;
  final services = Get.put(Services());
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  TextEditingController searchCont = TextEditingController();

  goToProgramDetails() {
    Get.toNamed(AppRoutes().programDetails);
  }

  goToSpecialServices() {
    Get.toNamed(AppRoutes().specialServices, arguments: {
      "serviceIndex": index,
    });
  }

  getProfileInfo(String token) async {
    emit(Loading());
    Either<Status, Map> response = await getProfileDataReq(token);
    response.fold((l) {
      if (l.type == StatusType.internetFailure) {
        services.sharedPref!.clear();
        Get.toNamed(AppRoutes().signIn);
        emit(InternetError());
      } else if (l .type== StatusType.serverFailure) {
        services.sharedPref!.clear();
        Get.toNamed(AppRoutes().signIn);
        emit(ServerError());
      }
    }, (r) {
      emit(Success([]));
      services.sharedPref!.setString("id", r['id'].toString());
      services.sharedPref!.setString("username", r['username'].toString());
      services.sharedPref!.setString("email", r['email'].toString());
      services.sharedPref!.setString("phone", r['phone'].toString());
    });
  }
}
