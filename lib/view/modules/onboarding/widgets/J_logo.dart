import 'package:flutter/widgets.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:sizer/sizer.dart';

class JLogo extends StatelessWidget {
  const JLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 28.h,
        left: 0.w,
        child: Container(
          width: 30.w,
          height: 13.h,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImages().J))),
        ));
  }
}
