import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/travel_programs/program_details_cubit.dart';
import 'package:jawla/view/modules/travel_programs/widgets/about_these_places.dart';
import 'package:jawla/view/modules/travel_programs/widgets/custom_container.dart';
import 'package:jawla/view/modules/travel_programs/widgets/program_details_image_widget.dart';
import 'package:jawla/view/modules/travel_programs/widgets/places_images.dart';
import 'package:jawla/view/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

class ProgramDetails extends StatelessWidget {
  const ProgramDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProgramDetailsCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<ProgramDetailsCubit>();
            return SafeArea(
              child: Scaffold(
                  backgroundColor: AppColor.secondColor,
                  body: Column(
                    children: [
                      const CustomAppbar(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: 100.w,
                        height: 83.h,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ProgramDetailsImageWidget(),
                              SizedBox(
                                height: 1.h,
                              ),
                              const AboutThesePlaces(),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomContainer(
                                widget: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.date_range,
                                          color: AppColor.secondColor,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        const Text(
                                          "Length",
                                          style: TextStyle(
                                              color: AppColor.secondColor),
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "3 Days",
                                      style: TextStyle(
                                          color: AppColor.secondColor),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              CustomContainer(
                                widget: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.groups,
                                          color: AppColor.secondColor,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        const Text(
                                          "Persons",
                                          style: TextStyle(
                                              color: AppColor.secondColor),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: const CircleAvatar(
                                            backgroundColor:
                                                AppColor.secondColor,
                                            radius: 15,
                                            child: Icon(
                                              Icons.remove,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        const Text(
                                          "01",
                                          style: TextStyle(
                                              color: AppColor.secondColor),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: const CircleAvatar(
                                            backgroundColor:
                                                AppColor.primaryColor,
                                            radius: 15,
                                            child: Icon(
                                              Icons.add,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              const PlacesImages(),
                              SizedBox(
                                height: 1.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        width: 95.w,
                        height: 6.h,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                              AppColor.bottomNavColor,
                              AppColor.bottomNavColor2
                            ]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              children: [
                                Text(
                                  "500 L.E",
                                  style: TextStyle(
                                      color: AppColor.secondColor,
                                      fontSize: 16),
                                ),
                                Text(
                                  "(2 Persons)",
                                  style: TextStyle(
                                      color: AppColor.secondColor,
                                      fontSize: 13),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                controller.goToPaymentMethods();
                              },
                              child: Container(
                                width: 50.w,
                                height: 5.h,
                                decoration: const BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: const Center(
                                  child: Text(
                                    "Book Now",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                    ],
                  )),
            );
          },
        ));
  }
}
