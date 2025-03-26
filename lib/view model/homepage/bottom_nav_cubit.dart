// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/services/services.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view/modules/homepage/screens/account.dart';
import 'package:jawla/view/modules/homepage/screens/discover.dart';
import 'package:jawla/view/modules/homepage/screens/homepage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavCubit extends Cubit<AppState> {
  BottomNavCubit() : super(Initial());
  final services = Get.put(Services());
  PersistentTabController? controller;

  List<Widget> pages = [
    const HomePage(),
    const Discover(),
    const Account(),
  ];

  List<PersistentBottomNavBarItem>? items = [
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home Page",
        iconSize: 27,
        activeColorPrimary: AppColor.secondColor,
        inactiveColorPrimary: Colors.black,
        activeColorSecondary: Colors.white),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.lightbulb_outline_rounded),
        title: "Discover",
        iconSize: 27,
        activeColorPrimary: AppColor.secondColor,
        inactiveColorPrimary: Colors.black,
        activeColorSecondary: Colors.white),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Account",
        iconSize: 27,
        activeColorPrimary: AppColor.secondColor,
        inactiveColorPrimary: Colors.black,
        activeColorSecondary: Colors.white)
  ];

 
}
