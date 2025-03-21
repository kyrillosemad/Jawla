import 'package:flutter/material.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/view/modules/auth/screens/forget_password.dart';
import 'package:jawla/view/modules/auth/screens/signin.dart';
import 'package:jawla/view/modules/auth/screens/signup.dart';
import 'package:jawla/view/modules/homepage/screens/account.dart';
import 'package:jawla/view/modules/homepage/screens/bookings.dart';
import 'package:jawla/view/modules/homepage/screens/bottom_nav.dart';
import 'package:jawla/view/modules/homepage/screens/discover.dart';
import 'package:jawla/view/modules/homepage/screens/favorite.dart';
import 'package:jawla/view/modules/homepage/screens/homepage.dart';
import 'package:jawla/view/modules/homepage/screens/settings.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding1.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding2.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding3.dart';
import 'package:jawla/view/modules/special_services/screens/special_services.dart';
import 'package:jawla/view/modules/travel_programs/screens/complete_payment.dart';
import 'package:jawla/view/modules/travel_programs/screens/payment_method.dart';
import 'package:jawla/view/modules/travel_programs/screens/program_details.dart';
import 'package:jawla/view/modules/travel_programs/screens/success_page.dart';

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
  AppRoutes().settings: (context) => const SettingsPage(),
  AppRoutes().favorite: (context) => const Favorite(),
  AppRoutes().bookings: (context) => const Bookings(),
  AppRoutes().programDetails: (context) => const ProgramDetails(),
  AppRoutes().paymentMethod: (context) => const PaymentMethod(),
  AppRoutes().completePayment: (context) => const CompletePayment(),
  AppRoutes().successPage: (context) => const SuccessPage(),
  AppRoutes().specialServices: (context) => const SpecialServices(),
};
