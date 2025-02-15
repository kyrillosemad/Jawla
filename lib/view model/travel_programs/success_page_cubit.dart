import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/view%20model/app_state.dart';

class SuccessPageCubit extends Cubit<AppState> {
  SuccessPageCubit() : super(Initial());
  goToHomePage() {
    Get.offAllNamed(AppRoutes().bottomNav);
  }
}
