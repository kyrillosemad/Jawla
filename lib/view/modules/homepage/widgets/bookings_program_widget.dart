import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/model/bookings/bookings_car_model.dart';
import 'package:jawla/model/bookings/bookings_guide_model.dart';
import 'package:jawla/model/bookings/bookings_package_model.dart';
import 'package:jawla/model/bookings/bookings_trip_model.dart';
import 'package:jawla/view/modules/homepage/widgets/bookings_trip.dart';
import 'package:jawla/view/modules/homepage/widgets/car_trip.dart';
import 'package:jawla/view/modules/homepage/widgets/guide_trip.dart';
import 'package:jawla/view/modules/homepage/widgets/package_trip.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:jawla/view%20model/homepage/bookings_cubit.dart';
import 'package:jawla/view/widgets/warning_widget.dart';
import 'package:jawla/core/constants/lottie.dart';
import 'package:jawla/view%20model/app_state.dart';

class BookingsProgramWidget extends StatelessWidget {
  final BookingsCubit controller;
  const BookingsProgramWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingsCubit, AppState>(
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
        } else if (controller.data.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(AppLottie().empty, height: 25.h),
              const SizedBox(height: 10),
              const Text(
                "No reservations yet!",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              const Text(
                "Browse and add reserve any service.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          );
        } else {
          return ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              final booking = controller.data[index];
              if (booking['type'] == 'Trip') {
                BookingsTripModel tripModel =
                    BookingsTripModel.fromJson(controller.data[index]);
                return BookingsTrip(
                  bookingsTripModel: tripModel,
                  controller: controller,
                );
              } else if (booking['type'] == 'Car') {
                CarTripModel carModel =
                    CarTripModel.fromJson(controller.data[index]);
                return CarTrip(carTripModel: carModel, controller: controller);
              } else if (booking['type'] == 'Special Trip') {
                PackageTripModel packageTripModel =
                    PackageTripModel.fromJson(controller.data[index]);
                return PackageTrip(
                    controller: controller, packageTripModel: packageTripModel);
              } else if (booking['type'] == 'Tour Guide') {
                GuideTripModel guideTripModel =
                    GuideTripModel.fromJson(controller.data[index]);
                return GuideTrip(
                    controller: controller, guideTripModel: guideTripModel);
              } else {
                return const SizedBox();
              }
            },
          );
        }
      },
    );
  }
}
