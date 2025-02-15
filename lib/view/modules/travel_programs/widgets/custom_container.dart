import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class CustomContainer extends StatelessWidget {
  final Widget widget;
  const CustomContainer({super.key,required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 95.w,
      height: 5.h,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColor.bottomNavColor, AppColor.bottomNavColor2]),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child:widget
    );
  }
}
