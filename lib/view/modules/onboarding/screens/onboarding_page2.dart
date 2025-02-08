import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/onboarding/on_boarding_cubit.dart';
import 'package:jawla/view/modules/onboarding/widgets/J_logo.dart';
import 'package:jawla/view/modules/onboarding/widgets/login_or_signup.dart';
import 'package:sizer/sizer.dart';

class OnBoardingPage2 extends StatelessWidget {
  final OnBoardingCubit controller;
  const OnBoardingPage2({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20, left: 30),
          width: 100.w,
          height: 45.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "is an application help \nyou to enjoy your trip \naround Egypt",
                style: TextStyle(fontSize: 15.sp, color: Colors.white),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Don’t worries about your trips \nhere you will enjoy it ",
                style: TextStyle(fontSize: 15.sp, color: Colors.white),
              ),
              SizedBox(
                height: 3.h,
              ),
              const JLogo(),
            ],
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
