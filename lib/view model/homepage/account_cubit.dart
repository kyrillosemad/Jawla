import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/core/services/services.dart';
import 'package:jawla/view%20model/app_state.dart';

class AccountCubit extends Cubit<AppState> {
  AccountCubit() : super(Initial());
  final services = Get.find<Services>();
  logOut() {
    services.sharedPref!.clear();
    Get.offAllNamed(AppRoutes().signIn);
  }

  goToFavorite() {
    Get.toNamed(AppRoutes().favorite);
  }

    goToSettings() {
    Get.toNamed(AppRoutes().settings);
  }
    goToBookings() {
    Get.toNamed(AppRoutes().bookings);
  }
}
