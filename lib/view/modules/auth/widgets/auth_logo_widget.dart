import 'package:flutter/material.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:sizer/sizer.dart';

class AuthLogoWidget extends StatelessWidget {
  const AuthLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 85.w,
        height: 17.h,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages().logo1))),
      ),
    );
  }
}
