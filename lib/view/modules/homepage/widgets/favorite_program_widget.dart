// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/core/constants/lottie.dart';
import 'package:jawla/model/trip/trip_model.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/homepage/favorite_cubit.dart';
import 'package:jawla/view%20model/homepage/trip_cubit.dart';
import 'package:jawla/view/widgets/warning_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class FavoriteProgramWidget extends StatelessWidget {
  final FavoriteCubit favoriteController;
  final TripCubit tripController;
  const FavoriteProgramWidget(
      {super.key,
      required this.favoriteController,
      required this.tripController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, AppState>(
      listener: (context, state) {
        if (state is InternetError) {
          warningWidget("Connection Error", Icons.wifi_off_rounded,
              "Please check your internet connection and try again.");
        } else if (state is ServerError) {
          warningWidget("Server Error", Icons.cloud_off,
              "Please check your server connection and try again.");
        } else if (state is ApiFailure) {
          warningWidget("Wrong", Icons.error, "${state.error}");
        }
      },
      builder: (context, state) {
        if (state is Loading) {
          return Center(
              child: LottieBuilder.asset(AppLottie().loading3, height: 20.h));
        } else if (favoriteController.data.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(AppLottie().empty, height: 25.h),
              const SizedBox(height: 10),
              const Text(
                "No favorite programs yet!",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              const Text(
                "Browse and add programs to your favorites.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          );
        } else {
          return SizedBox(
            width: 95.w,
            height: 21.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: favoriteController.data.length,
              itemBuilder: (BuildContext context, int index) {
                TripModel tripModel =
                    TripModel.fromJson(favoriteController.data[index]);
                return Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 2.h),
                  width: 95.w,
                  height: 21.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: tripModel.mainImage == null ||
                                  tripModel.mainImage == ""
                              ? AssetImage(AppImages().bj3) as ImageProvider
                              : NetworkImage(tripModel.mainImage!)
                                  as ImageProvider,
                          fit: BoxFit.fill,
                          opacity: 0.8),
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 1.h,
                        right: 4.w,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 203, 208, 220),
                          child: IconButton(
                              onPressed: () {
                                favoriteController
                                    .removeFavoriteFun(tripModel.id.toString());
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                        ),
                      ),
                      Positioned(
                        top: 1.5.h,
                        left: 4.w,
                        child: tripModel.type == "VIP"
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
                            padding: const EdgeInsets.all(7),
                            width: 75.w,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 218, 223, 235)
                                    .withOpacity(0.8)
                                    .withAlpha(230),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${tripModel.title}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: AppColor.secondColor),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 20,
                                          color: AppColor.secondColor,
                                        ),
                                        Text(
                                          "${tripModel.location}",
                                          style: const TextStyle(
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
                                      "${tripModel.duration} Days",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColor.secondColor),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          "${tripModel.price} L.E",
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: AppColor.secondColor),
                                        )
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        favoriteController
                                            .goToProgramDetails(tripModel.id);
                                      },
                                      child: Container(
                                        width: 20.w,
                                        height: 3.h,
                                        decoration: BoxDecoration(
                                            color: AppColor.secondColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                          child: Text(
                                            "Book Now",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),
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
                );
              },
            ),
          );
        }
      },
    );
  }
}
