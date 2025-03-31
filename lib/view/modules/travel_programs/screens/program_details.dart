import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/lottie.dart';
import 'package:jawla/model/trip/trip_details_model.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/homepage/favorite_cubit.dart';
import 'package:jawla/view%20model/travel_programs/program_details_cubit.dart';
import 'package:jawla/view/modules/travel_programs/widgets/about_these_places.dart';
import 'package:jawla/view/modules/travel_programs/widgets/custom_container.dart';
import 'package:jawla/view/modules/travel_programs/widgets/program_details_image_widget.dart';
import 'package:jawla/view/modules/travel_programs/widgets/places_images.dart';
import 'package:jawla/view/widgets/custom_appbar.dart';
import 'package:jawla/view/widgets/warning_widget.dart';
import 'package:lottie/lottie.dart';
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
            var favoriteController = context.read<FavoriteCubit>();
            controller.getTripDetails(controller.id);
            return SafeArea(
              child: Scaffold(
                  backgroundColor: AppColor.secondColor,
                  body: Column(
                    children: [
                      const CustomAppbar(),
                      BlocConsumer<ProgramDetailsCubit, AppState>(
                        listener: (context, state) {
                          if (state is InternetError) {
                            warningWidget(
                                "Connection Error",
                                Icons.wifi_off_rounded,
                                "Please check your internet connection and try again.");
                          } else if (state is ServerError) {
                            warningWidget("Server Error", Icons.cloud_off,
                                "Please check your server connection and try again.");
                          } else if (state is ApiFailure) {
                            warningWidget(
                                "Wrong", Icons.error, "${state.error}");
                          }
                        },
                        builder: (context, state) {
                          if (state is Loading) {
                            return SizedBox(
                              width: 100.w,
                              height: 82.h,
                              child: Center(
                                  child: LottieBuilder.asset(
                                AppLottie().loading3,
                                height: 200,
                              )),
                            );
                          } else {
                            TripDetailsModel tripDetailsModel =
                                TripDetailsModel.fromJson(controller.data[0]);
                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  width: 100.w,
                                  height: 83.h,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ProgramDetailsImageWidget(
                                          favoriteController: favoriteController,
                                            tripDetailsModel: tripDetailsModel,
                                            controller: controller),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        AboutThesePlaces(
                                            tripDetailsModel: tripDetailsModel),
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
                                                        color: AppColor
                                                            .secondColor),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "${tripDetailsModel.duration} Days",
                                                style: const TextStyle(
                                                    color:
                                                        AppColor.secondColor),
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
                                                        color: AppColor
                                                            .secondColor),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      controller.decrement();
                                                    },
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
                                                    width: 3.w,
                                                  ),
                                                  Text(
                                                    "${controller.numOfPersons}",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .secondColor,
                                                        fontSize: 15.sp),
                                                  ),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller.increment();
                                                    },
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
                                        PlacesImages(
                                            tripDetailsModel: tripDetailsModel,
                                            controller: controller),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "${controller.numOfPersons * controller.data[0]['price']} L.E",
                                            style: const TextStyle(
                                                color: AppColor.secondColor,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "(${controller.numOfPersons} Persons)",
                                            style: const TextStyle(
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: const Center(
                                            child: Text(
                                              "Book Now",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
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
                            );
                          }
                        },
                      ),
                    ],
                  )),
            );
          },
        ));
  }
}
