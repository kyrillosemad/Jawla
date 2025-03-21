import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class CustomRow extends StatelessWidget {
  final IconData icon;
  final IconData icon2;
  final void Function() function;
  final String name;
  const CustomRow(
      {super.key,
      required this.function,
      required this.icon,
      required this.icon2,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Icon(
              icon,
              size: 27.sp,
              color: AppColor.secondColor,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 15.sp),
            ),
          ],
        ),
        IconButton(
            onPressed: function,
            icon: Icon(
              icon2,
              size: 22.sp,
              color: AppColor.primaryColor,
            ))
      ],
    );
  }
}
