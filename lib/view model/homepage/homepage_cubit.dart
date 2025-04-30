// lib/view model/homepage/homepage_cubit.dart
// ignore_for_file: unrelated_type_equality_checks

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/classes/status.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/core/services/services.dart';
import 'package:jawla/data/profile/get_profile_data__request.dart';
import 'package:jawla/view model/app_state.dart';
import '../../data/home/trip/get_all_trips.dart';

class HomePageCubit extends Cubit<AppState> {
  HomePageCubit() : super(Initial());
  int index = 0;
  final services = Get.put(Services());
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  TextEditingController searchCont = TextEditingController();

  List data = [];
  List vipData = [];

  goToProgramDetails(int? id) {
    Get.toNamed(AppRoutes().programDetails);
  }

  goToProgramDetails2(int? id) {
    Get.toNamed(AppRoutes().programDetails, arguments: {
      "id": id,
    });
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
      if (l.type == StatusType.internetFailure ||
          l.type == StatusType.serverFailure) {
        services.sharedPref!.clear();
        Get.toNamed(AppRoutes().signIn);
        emit(l.type == StatusType.internetFailure
            ? InternetError()
            : ServerError());
      }
    }, (r) {
      emit(Success([]));
      services.sharedPref!.setString("id", r['id'].toString());
      services.sharedPref!.setString("username", r['username'].toString());
      services.sharedPref!.setString("email", r['email'].toString());
      services.sharedPref!.setString("phone", r['phone'].toString());
    });
  }

  getAllTrips(String search) async {
    emit(Loading());
    Either<Status, Map> response = await getAllTripsReq();
    response.fold((l) {
      if (l.type == StatusType.internetFailure) {
        emit(InternetError());
      } else if (l.type == StatusType.serverFailure) {
        emit(ServerError());
      } else if (l.type == StatusType.apiFailure) {
        emit(ApiFailure(l.errorData['errors']));
      }
    }, (r) {
      data = r['data'];
      vipData = data.where((trip) => trip['types'] == 'vip').toList();
      if (searchCont.text.isEmpty) {
        data = data;
        vipData = vipData;
      } else {
        data = data
            .where((element) =>
                element['title'].toString().toLowerCase().startsWith(search))
            .toList();
        vipData = vipData
            .where((element) =>
                element['title'].toString().toLowerCase().startsWith(search))
            .toList();
      }
      emit(Success(data));
    });
  }
}
