import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/view%20model/onboarding/on_boarding_cubit.dart';
import 'package:jawla/view/modules/onboarding/widgets/login_or_signup.dart';
import 'package:sizer/sizer.dart';

class OnBoardingPage1 extends StatelessWidget {
  final OnBoardingCubit controller;
  const OnBoardingPage1({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 45.h,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages().travelers)),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        LoginOrSignup(
            borderColor: AppColor.secondColor2,
            color: Colors.transparent,
            controller: controller,
            function: () {
              controller.goToSignup();
            },
            name: "Sign up"),
        SizedBox(
          height: 2.h,
        ),
        LoginOrSignup(
            borderColor: Colors.transparent,
            color: AppColor.secondColor2,
            controller: controller,
            function: () {
              controller.goToSignin();
            },
            name: "Sign in")
      ],
    );
  }
}
