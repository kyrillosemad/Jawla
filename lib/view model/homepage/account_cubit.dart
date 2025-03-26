import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/core/services/services.dart';
import 'package:jawla/view%20model/app_state.dart';

class AccountCubit extends Cubit<AppState> {
  AccountCubit() : super(Initial());

  final services = Get.put(Services());

  void logOut() {
    services.sharedPref!.clear();
    Get.offAllNamed(AppRoutes().signIn);
  }

  void goToFavorite() {
    Get.toNamed(AppRoutes().favorite);
  }

  void goToSettings() {
    Get.toNamed(AppRoutes().settings);
  }

  void goToBookings() {
    Get.toNamed(AppRoutes().bookings);
  }
}
