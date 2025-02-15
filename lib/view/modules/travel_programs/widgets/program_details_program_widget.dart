import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class ProgramDetailsProgramWidget extends StatelessWidget {
  const ProgramDetailsProgramWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 12.h,
      child: Container(
        padding: const EdgeInsets.all(7),
        width: 60.w,
        height: 12.h,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 218, 223, 235)
                .withOpacity(0.8)
                .withAlpha(180),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Luxor Temples",
                  style: TextStyle(fontSize: 15, color: AppColor.secondColor),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 20,
                      color: AppColor.secondColor,
                    ),
                    Text(
                      "Luxor",
                      style:
                          TextStyle(fontSize: 13, color: AppColor.secondColor),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            const Row(
              children: [
                Icon(
                  Icons.date_range,
                  size: 17,
                  color: AppColor.secondColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "3 Days",
                  style: TextStyle(fontSize: 12, color: AppColor.secondColor),
                )
              ],
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      size: 20,
                      color: AppColor.secondColor,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    const Text(
                      "250 L.E",
                      style:
                          TextStyle(fontSize: 13, color: AppColor.secondColor),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
