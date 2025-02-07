import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/core/localization/change_locale.dart';
import 'package:jawla/view%20model/app_state.dart';

class OnBoardingCubit extends Cubit<AppState> {
  OnBoardingCubit() : super(Initial());

  goToOnBoarding2() {
    Get.offAllNamed(AppRoutes().onboarding2);
  }

  goToOnBoarding3() {
    Get.offAllNamed(AppRoutes().onboarding3);
  }

  goToOnBoarding4() {
    Get.offAllNamed(AppRoutes().onboarding4);
  }

  setLanguageToAr() {
    LocaleClass().changeLocale("AR");
    emit(Initial());
  }

  setLanguageToEn() {
    LocaleClass().changeLocale("EN");
    emit(Initial());
  }
}
