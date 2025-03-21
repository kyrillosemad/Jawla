import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Divider(
        color: AppColor.secondColor.withOpacity(0.5),
        thickness: 1,
        height: 1.5,
      ),
    );
  }
}
