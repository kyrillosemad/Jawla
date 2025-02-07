import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/on_boarding_cubit.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final OnBoardingCubit controller;
  final String name;
  final void Function()? function;
  const CustomButton(
      {super.key,
      required this.controller,
      required this.name,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 5.h,
        right: 5.w,
        child: InkWell(
          onTap: function,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.sp)),
            width: 50.w,
            height: 8.h,
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.secondColor),
              ),
            ),
          ),
        ));
  }
}
