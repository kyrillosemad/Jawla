import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class AuthCustomButton extends StatelessWidget {
  final void Function()? function;
  final String name;
  const AuthCustomButton(
      {super.key, required this.function, required this.name});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: function,
      child: Container(
        width: 90.w,
        height: 7.h,
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(color: AppColor.secondColor, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
