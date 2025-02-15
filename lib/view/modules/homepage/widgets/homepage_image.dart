import 'package:flutter/material.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:sizer/sizer.dart';

class HomePageImage extends StatelessWidget {
  const HomePageImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 96.w,
      height: 20.h,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(100), topRight: Radius.circular(100)),
          image: DecorationImage(
              image: AssetImage(
                AppImages().bj3,
              ),
              fit: BoxFit.cover,
              opacity: 0.4)),
    );
  }
}
