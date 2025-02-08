import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/onboarding/on_boarding_cubit.dart';
import 'package:jawla/view/modules/onboarding/widgets/language_button.dart';
import 'package:sizer/sizer.dart';

class ChooseLang extends StatelessWidget {
  final OnBoardingCubit controller;
  const ChooseLang({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 37.h,
        left: 10.w,
        child: Center(
          child: SizedBox(
              width: 80.w,
              height: 20.h,
              child: Column(
                children: [
                  LanguageButton(
                    controller: controller,
                    name: "العربية",
                    color: Colors.transparent,
                    borderColor: AppColor.secondColor2,
                    function: () {},
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  LanguageButton(
                    controller: controller,
                    name: "English",
                    color: AppColor.secondColor2,
                    borderColor: Colors.transparent,
                    function: () {},
                  ),
                ],
              )),
        ));
  }
}
