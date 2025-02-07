import 'package:flutter/material.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:sizer/sizer.dart';

class YellowEllipse extends StatelessWidget {
  const YellowEllipse({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0.h,
        left: 0,
        child: SizedBox(
            height: 32.h,
            child: Image(image: AssetImage(AppImages().yelloEllipse))));
  }
}
