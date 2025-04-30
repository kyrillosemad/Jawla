import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/model/bookings/bookings_guide_model.dart';
import 'package:jawla/view%20model/homepage/bookings_cubit.dart';
import 'package:sizer/sizer.dart';

class GuideTrip extends StatelessWidget {
  final GuideTripModel guideTripModel;
  final BookingsCubit controller;

  const GuideTrip({
    super.key,
    required this.guideTripModel,
    required this.controller,
  });

  String _formatDate(String? date) {
    if (date == null) return 'Unknown';
    try {
      final parsedDate = DateTime.parse(date);
      final formattedDate = DateFormat('dd/MM/yyyy - HH:mm').format(parsedDate);
      return formattedDate;
    } catch (e) {
      return 'Invalid Date';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 2.h),
        width: 90.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages().bj3),
            fit: BoxFit.fill,
            opacity: 0.8,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: EdgeInsets.all(2.5.w),
          padding: const EdgeInsets.all(7),
          width: 85.w,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 218, 223, 235)
                .withOpacity(0.8)
                .withAlpha(230),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // يجعل الارتفاع حسب المحتوى
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.person,
                    color: AppColor.secondColor,
                    size: 30.sp,
                  ),
                  guideTripModel.state != "Pending"
                      ? InkWell(
                          onTap: () {},
                          child: Container(
                            width: 25.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Accepted",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {},
                          child: Container(
                            width: 25.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Pending",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${guideTripModel.type}",
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColor.secondColor,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 20,
                        color: AppColor.secondColor,
                      ),
                      Text(
                        "${guideTripModel.startPlace}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColor.secondColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                color: Colors.white,
                thickness: 1,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${guideTripModel.destinations}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColor.secondColor,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  const Icon(
                    Icons.date_range,
                    size: 17,
                    color: AppColor.secondColor,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${_formatDate(guideTripModel.startDate)}  -->  ${_formatDate(guideTripModel.endDate)}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColor.secondColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.monetization_on,
                    size: 20,
                    color: AppColor.secondColor,
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    "${guideTripModel.price} L.E",
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColor.secondColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
