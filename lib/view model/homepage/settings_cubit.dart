import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/core/services/services.dart';
import 'package:jawla/view%20model/app_state.dart';

class SettingsCubit extends Cubit<AppState> {
  SettingsCubit() : super(Initial());
  final services = Get.put(Services());

  goToChangeAccountData() {
    Get.toNamed(AppRoutes().changeAccountData);
  }

  goToChangePassword() {
    Get.toNamed(AppRoutes().changePassword);
  }

  goToDeleteAccount() {
    Get.toNamed(AppRoutes().deleteAccount);
  }
}
