import 'package:flutter/material.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding1.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding2.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding3.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding4.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().onboarding1: (context) => const OnBoarding1(),
  AppRoutes().onboarding2: (context) => const OnBoarding2(),
  AppRoutes().onboarding3: (context) => const OnBoarding3(),
  AppRoutes().onboarding4: (context) => const OnBoarding4(),
};
