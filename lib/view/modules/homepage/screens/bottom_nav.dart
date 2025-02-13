import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/bottom_nav_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BottomNavCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<BottomNavCubit>();
            return PersistentTabView(
              context,
              controller: controller.controller,
              screens: controller.pages,
              items: controller.items,
              confineInSafeArea: true,
              handleAndroidBackButtonPress: true,
              resizeToAvoidBottomInset: true,
              stateManagement: true,
              hideNavigationBarWhenKeyboardShows: true,
              decoration: const NavBarDecoration(
                  gradient: LinearGradient(colors: [
                    AppColor.bottomNavColor,
                    AppColor.bottomNavColor2
                  ]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: const ItemAnimationProperties(
                duration: Duration(milliseconds: 250),
                curve: Curves.easeIn,
              ),
              screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.easeInQuad,
                duration: Duration(milliseconds: 250),
              ),
              navBarStyle: NavBarStyle.style10,
            );
          },
        ));
  }
}
