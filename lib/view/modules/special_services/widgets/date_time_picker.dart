import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

Widget buildDateTimePicker(BuildContext context,
    {required String title,
    required DateTime dateTime,
    required Function onTap}) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.primaryColor)),
      child: Column(
        children: [
          Text(title,
              style:
                  const TextStyle(color: AppColor.primaryColor, fontSize: 14)),
          SizedBox(height: 1.h),
          Text(
            "${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute}",
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor),
          ),
        ],
      ),
    ),
  );
}
