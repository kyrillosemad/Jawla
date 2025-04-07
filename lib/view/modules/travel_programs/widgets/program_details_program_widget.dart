import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/model/trip/trip_details_model.dart';
import 'package:sizer/sizer.dart';

class ProgramDetailsProgramWidget extends StatelessWidget {
  final TripDetailsModel tripDetailsModel;
  const ProgramDetailsProgramWidget(
      {super.key, required this.tripDetailsModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: Container(
        padding: const EdgeInsets.all(7),
        width: 60.w,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 218, 223, 235)
                .withOpacity(0.8)
                .withAlpha(180),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${tripDetailsModel.title}",
                  style: const TextStyle(
                      fontSize: 15, color: AppColor.secondColor),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 20,
                      color: AppColor.secondColor,
                    ),
                    Text(
                      "${tripDetailsModel.location}",
                      style: const TextStyle(
                          fontSize: 13, color: AppColor.secondColor),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Row(
              children: [
                const Icon(
                  Icons.date_range,
                  size: 17,
                  color: AppColor.secondColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${tripDetailsModel.duration} Days",
                  style: const TextStyle(
                      fontSize: 12, color: AppColor.secondColor),
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
                    Text(
                      "${tripDetailsModel.price} L.E",
                      style: const TextStyle(
                          fontSize: 13, color: AppColor.secondColor),
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
