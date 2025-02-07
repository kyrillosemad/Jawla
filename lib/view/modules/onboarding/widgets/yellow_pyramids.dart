import 'package:flutter/widgets.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:sizer/sizer.dart';

class YellowPyramids extends StatelessWidget {
  const YellowPyramids({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 32.h,
        right: 17.w,
        child: Container(
          width: 30.w,
          height: 13.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages().yellowPyramids))),
        ));
  }
}
