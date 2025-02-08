import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/core/localization/change_locale.dart';
import 'package:jawla/view%20model/app_state.dart';

class OnBoardingCubit extends Cubit<AppState> {
  OnBoardingCubit() : super(Initial());

  PageController pageController = PageController();

  void goToNextPage() {
    int nextPage = (pageController.page?.toInt() ?? 0) + 1;
    if (nextPage < 2) {
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToPreviousPage() {
    int previousPage = (pageController.page?.toInt() ?? 0) - 1;
    if (previousPage >= 0) {
      pageController.animateToPage(
        previousPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToOnBoarding2() {
    Get.offAllNamed(AppRoutes().onboarding2);
  }

  void goToOnBoarding3() {
    Get.offAllNamed(AppRoutes().onboarding3);
  }

  void goToSignin() {
    Get.offAllNamed(AppRoutes().signIn);
  }

  void goToSignup() {
    Get.offAllNamed(AppRoutes().signUp);
  }

  void setLanguageToAr() {
    LocaleClass().changeLocale("AR");
    emit(Initial());
  }

  void setLanguageToEn() {
    LocaleClass().changeLocale("EN");
    emit(Initial());
  }
}
