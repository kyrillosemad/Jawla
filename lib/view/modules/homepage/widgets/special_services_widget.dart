import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class SpecialServicesWidget extends StatelessWidget {

  final String name;
  final void Function()? function;
  final IconData icon;
  const SpecialServicesWidget(
      {super.key,
      required this.function,
      required this.icon,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 32.w,
        height: 12.h,
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            Icon(
              icon,
              size: 33,
              color: AppColor.secondColor,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 12, color: AppColor.secondColor),
            )
          ],
        ),
      ),
    );
  }
}
