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

class HomePageProgramWidget extends StatelessWidget {
  final TripCubit tripController;
  final FavoriteCubit favoriteController;
  const HomePageProgramWidget(
      {super.key,
      required this.tripController,
      required this.favoriteController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripCubit, AppState>(
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
              child: LottieBuilder.asset(AppLottie().loading2, height: 20.h));
        } else if (tripController.data.isEmpty ||
            state is InternetError ||
            state is ServerError ||
            state is ApiFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                const Text(
                  "No trips available at the moment",
                  style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
                ),
              ],
            ),
          );
        } else {
          return SizedBox(
            width: 100.w,
            height: 21.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: tripController.data.length,
              itemBuilder: (BuildContext context, int index) {
                TripModel tripModel =
                    TripModel.fromJson(tripController.data[index]);
                bool isFavorite = context
                    .watch<FavoriteCubit>()
                    .isTripFavorite(tripModel.id.toString());
                return Container(
                  margin: const EdgeInsets.only(left: 8),
                  width: 73.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: tripModel.mainImage == null ||
                                  tripModel.mainImage!.isEmpty
                              ? AssetImage(AppImages().bj1) as ImageProvider
                              : NetworkImage(tripModel.mainImage!)
                                  as ImageProvider,
                          fit: BoxFit.fill,
                          opacity: 0.8),
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 1.h,
                          right: 4.w,
                          child: BlocBuilder<FavoriteCubit, AppState>(
                              builder: (context, state) {
                            return CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 203, 208, 220),
                              child: IconButton(
                                  onPressed: () {
                                    favoriteController.toggleFavorite(
                                        tripModel.id.toString());
                                  },
                                  icon: isFavorite
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : const Icon(
                                          Icons.favorite_border,
                                          color: AppColor.secondColor,
                                        )),
                            );
                          })),
                      Positioned(
                          top: 1.5.h,
                          left: 4.w,
                          child: tripModel.type == "VIP"
                              ? const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                )
                              : Container()),
                      Positioned(
                        bottom: 1.h,
                        left: 7.w,
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 218, 223, 235)
                                  .withOpacity(0.8)
                                  .withAlpha(230),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
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
                                      tripController
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
