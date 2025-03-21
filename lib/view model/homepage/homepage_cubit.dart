import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/view%20model/app_state.dart';

class HomePageCubit extends Cubit<AppState> {
  HomePageCubit() : super(Initial());
  int index = 0;

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


}
