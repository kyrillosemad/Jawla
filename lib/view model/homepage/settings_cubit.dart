import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/view%20model/app_state.dart';

class SettingsCubit extends Cubit<AppState> {
  SettingsCubit() : super(Initial());
  goToChangeEmail() {
    Get.toNamed(AppRoutes().changeEmail);
  }

  goToChangeName() {
    Get.toNamed(AppRoutes().changeName);
  }

  goToChangePhone() {
    Get.toNamed(AppRoutes().changePhone);
  }

  goToChangePassword() {
    Get.toNamed(AppRoutes().changePassword);
  }

  goToDeleteAccount() {
    Get.toNamed(AppRoutes().deleteAccount);
  }
}
