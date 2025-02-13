import 'package:flutter/material.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/view/modules/auth/screens/forget_password.dart';
import 'package:jawla/view/modules/auth/screens/signin.dart';
import 'package:jawla/view/modules/auth/screens/signup.dart';
import 'package:jawla/view/modules/homepage/screens/account.dart';
import 'package:jawla/view/modules/homepage/screens/bottom_nav.dart';
import 'package:jawla/view/modules/homepage/screens/discover.dart';
import 'package:jawla/view/modules/homepage/screens/homepage.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding1.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding2.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding3.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().onboarding1: (context) => const OnBoarding1(),
  AppRoutes().onboarding2: (context) => const OnBoarding2(),
  AppRoutes().onboarding3: (context) => const OnBoarding3(),
  AppRoutes().signIn: (context) => const SignIn(),
  AppRoutes().signUp: (context) => const SignUp(),
  AppRoutes().forgetPassword: (context) => const ForgetPassword(),
  AppRoutes().bottomNav: (context) => const BottomNav(),
  AppRoutes().homePage: (context) => const HomePage(),
  AppRoutes().discover: (context) => const Discover(),
  AppRoutes().account: (context) => const Account(),
};
