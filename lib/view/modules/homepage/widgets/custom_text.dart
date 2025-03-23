import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class CustomText extends StatelessWidget {
  final String name;
  const CustomText({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          fontSize: 22.sp,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold),
    );
  }
}
