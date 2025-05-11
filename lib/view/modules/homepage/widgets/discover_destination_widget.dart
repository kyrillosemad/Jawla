// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/model/static%20data/static_data_model.dart';
import 'package:sizer/sizer.dart';

class DiscoverDestinationWidget extends StatelessWidget {
  final StaticDataModel destination;

  const DiscoverDestinationWidget({super.key, required this.destination});

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
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white.withOpacity(0.8), width: 2),
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
            // Title
            Text(
              destination.label,
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
              children: List.generate(
                destination.images.length.clamp(0, 4),
                (index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(destination.images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 2.h),

            // Location
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.white, size: 18),
                SizedBox(width: 2.w),
                Expanded(
                  child: Text(
                    destination.location,
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),

            // Info
            Text(
              "Description:",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              destination.description,
              style: TextStyle(color: Colors.white, fontSize: 10.sp),
            ),
          ],
        ),
      ),
    );
  }
}
