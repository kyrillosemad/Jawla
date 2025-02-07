import 'package:flutter/widgets.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:sizer/sizer.dart';

class WhitePyramids extends StatelessWidget {
  const WhitePyramids({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 15.h,
        left: 25.w,
        child: Container(
          width: 30.w,
          height: 13.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages().whitePyramids))),
        ));
  }
}
