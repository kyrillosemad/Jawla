import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/view%20model/homepage/homepage_cubit.dart';
import 'package:sizer/sizer.dart';

class HomePageProgramWidget extends StatelessWidget {
  final HomePageCubit controller;
  const HomePageProgramWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 20.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(left: 8),
            width: 73.w,
            height: 13.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages().bj1),
                    fit: BoxFit.cover,
                    opacity: 0.4),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                Positioned(
                  top: 1.h,
                  right: 4.w,
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 203, 208, 220),
                    child: Icon(
                      Icons.favorite_border,
                      color: AppColor.secondColor,
                    ),
                  ),
                ),
                Positioned(
                  top: 1.5.h,
                  left: 4.w,
                  child: const Icon(
                    Icons.safety_check,
                    color: AppColor.secondColor,
                  ),
                ),
                Positioned(
                  bottom: 1.h,
                  left: 7.w,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    width: 60.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 218, 223, 235)
                            .withOpacity(0.8)
                            .withAlpha(230),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Luxor Temples",
                              style: TextStyle(
                                  fontSize: 15, color: AppColor.secondColor),
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
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: AppColor.secondColor),
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
                              style: TextStyle(
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
                                const Text(
                                  "250 L.E",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: AppColor.secondColor),
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                controller.goToProgramDetails();
                              },
                              child: Container(
                                width: 20.w,
                                height: 3.h,
                                decoration: BoxDecoration(
                                    color: AppColor.secondColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Text(
                                    "Book Now",
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
              ],
            ),
          );
        },
      ),
    );
  }
}
