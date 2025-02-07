import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/images.dart';

class WhiteEllipse extends StatelessWidget {
  const WhiteEllipse({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 50.h,
        right: 0,
        child: SizedBox(
            height: 32.h,
            child: Image(image: AssetImage(AppImages().whiteEllipse))));
  }
}
