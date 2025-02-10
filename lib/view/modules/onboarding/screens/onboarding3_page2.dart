import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/onboarding/on_boarding_cubit.dart';
import 'package:jawla/view/modules/onboarding/widgets/J_logo.dart';
import 'package:jawla/view/modules/onboarding/widgets/login_or_signup.dart';
import 'package:sizer/sizer.dart';

class OnBoarding3Page2 extends StatelessWidget {
  final OnBoardingCubit controller;
  const OnBoarding3Page2({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // النصوص التعريفية
        Container(
          padding: const EdgeInsets.only(top: 20, left: 30),
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "is an application help \nyou to enjoy your trip \naround Egypt",
                style: TextStyle(fontSize: 15.sp, color: Colors.white),
              ),
              SizedBox(height: 4.h),
              Text(
                "Don’t worry about your trips \nhere you will enjoy it",
                style: TextStyle(fontSize: 15.sp, color: Colors.white),
              ),
              SizedBox(height: 3.h),
              const Center(child: JLogo()),
            ],
          ),
        ),
        SizedBox(height: 5.h),

        // زر Sign Up
        LoginOrSignup(
          borderColor: AppColor.secondColor2,
          color: Colors.transparent,
          controller: controller,
          function: controller.goToSignup,
          name: "Sign up",
        ),
        SizedBox(height: 2.h),

        // زر Sign In
        LoginOrSignup(
          borderColor: Colors.transparent,
          color: AppColor.secondColor2,
          controller: controller,
          function: controller.goToSignin,
          name: "Sign in",
        ),
      ],
    );
  }
}
