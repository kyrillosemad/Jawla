import 'package:flutter/material.dart';
import 'package:jawla/view%20model/onboarding/on_boarding_cubit.dart';
import 'package:sizer/sizer.dart';

class LoginOrSignup extends StatelessWidget {
  final OnBoardingCubit controller;
  final String name;
  final void Function()? function;
  final Color? color;
  final Color borderColor;
  const LoginOrSignup(
      {super.key,
      required this.borderColor,
      required this.color,
      required this.controller,
      required this.function,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: function,
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 2),
                color: color,
                borderRadius: BorderRadius.circular(12.sp)),
            width: 75.w,
            height: 6.h,
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Colors.white),
              ),
            )));
  }
}
