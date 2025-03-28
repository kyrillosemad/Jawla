// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:sizer/sizer.dart';

class DiscoverDestinationWidget extends StatelessWidget {
  final controller;
  const DiscoverDestinationWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.w),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages().back4),
            fit: BoxFit.fill,
            opacity: 0.15,
          ),
          color: AppColor.secondColor,
          borderRadius: BorderRadius.circular(15), // زوايا أكثر انحناءً
          border: Border.all(
              color: Colors.white.withOpacity(0.8), width: 2), // إطار واضح
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1),
              spreadRadius: 4,
              blurRadius: 7,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Karnak Temple",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 2.h),
            // Image Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 2.w,
              crossAxisSpacing: 2.w,
              children: List.generate(4, (index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(AppImages().bj1),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 2.h),
            // Address & Favorite Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        color: Colors.white, size: 18),
                    SizedBox(width: 2.w),
                    Text(
                      "Corniche El Nil, Luxor, Egypt.",
                      style: TextStyle(color: Colors.white, fontSize: 10.sp),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Text(
              "Info:",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              "• Construction Date: Began around 2000 BCE during the Middle Kingdom.\n"
              "• Primary Builders: Pharaohs like Thutmose III, Hatshepsut, and Ramses II.\n"
              "• Purpose: Dedicated to Amun-Ra, it was the main religious center of Thebes.\n"
              "• Architectural Features: Hypostyle Hall with 134 massive columns.",
              style: TextStyle(color: Colors.white, fontSize: 10.sp),
            ),
          ],
        ),
      ),
    );
  }
}
