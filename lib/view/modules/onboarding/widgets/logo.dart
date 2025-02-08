import 'package:flutter/material.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:sizer/sizer.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 5.h,
        left: 3.w,
        child: Container(
          width: 40.w,
          height: 10.h,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImages().logo2))),
        ));
  }
}
