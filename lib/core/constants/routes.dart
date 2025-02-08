import 'package:flutter/material.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/view/modules/auth/screens/check_email.dart';
import 'package:jawla/view/modules/auth/screens/forget_password.dart';
import 'package:jawla/view/modules/auth/screens/new_password.dart';
import 'package:jawla/view/modules/auth/screens/signin.dart';
import 'package:jawla/view/modules/auth/screens/signup.dart';
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
  AppRoutes().checkEmail: (context) => const CheckEmail(),
  AppRoutes().newPassword: (context) => const NewPassword(),
};
