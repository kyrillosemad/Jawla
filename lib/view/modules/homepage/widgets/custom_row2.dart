import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class CustomRow2 extends StatelessWidget {
  final IconData leadingIcon;
  final IconData trailingIcon;
  final VoidCallback onTap;
  final String title;
  final String content;

  const CustomRow2({
    super.key,
    required this.onTap,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Card(
        color: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          leading: Icon(
            leadingIcon,
            size: 27.sp,
            color: AppColor.secondColor,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            content,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey.shade900,
            ),
          ),
          trailing: IconButton(
            onPressed: onTap,
            icon: Icon(
              trailingIcon,
              size: 22.sp,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
