import 'package:flutter/material.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/model/bookings/bookings_trip_model.dart';
import 'package:jawla/view%20model/homepage/bookings_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/colors.dart';

class BookingsTrip extends StatelessWidget {
  final BookingsTripModel bookingsTripModel;
  final BookingsCubit controller;
  const BookingsTrip(
      {super.key, required this.bookingsTripModel, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 2.h),
        width: 95.w,
        height: 21.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: bookingsTripModel.images?.mainImage == null ||
                    bookingsTripModel.images!.mainImage!.isEmpty
                ? AssetImage(AppImages().bj3) as ImageProvider
                : NetworkImage(bookingsTripModel.images!.mainImage!),
            fit: BoxFit.fill,
            opacity: 0.8,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 1.h,
              right: 4.w,
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 203, 208, 220),
                child: Text(
                  "${bookingsTripModel.paymentAmount}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondColor),
                ),
              ),
            ),
            Positioned(
              top: 1.5.h,
              left: 4.w,
              child: bookingsTripModel.type == "VIP"
                  ? Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20.sp,
                    )
                  : Container(),
            ),
            Positioned(
              bottom: 1.h,
              left: 7.w,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: 2.5.w),
                  padding: const EdgeInsets.all(7),
                  width: 75.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 218, 223, 235)
                          .withOpacity(0.8)
                          .withAlpha(230),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${bookingsTripModel.title}",
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
                                "${bookingsTripModel.location}",
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
                            "${bookingsTripModel.duration} Days",
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
                                "${bookingsTripModel.price} L.E",
                                style: const TextStyle(
                                    fontSize: 13, color: AppColor.secondColor),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              controller
                                  .goToProgramDetails(bookingsTripModel.id);
                            },
                            child: Container(
                              width: 23.w,
                              height: 3.h,
                              decoration: BoxDecoration(
                                  color: AppColor.secondColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text(
                                  "show Details",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
