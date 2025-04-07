import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/model/bookings/bookings_car_model.dart';
import 'package:jawla/model/bookings/bookings_guide_model.dart';
import 'package:jawla/model/bookings/bookings_package_model.dart';
import 'package:jawla/model/bookings/bookings_trip_model.dart';
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
                return Card(
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    title: Text(
                      tripModel.title ?? 'No Title',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text("Location: ${tripModel.location}",
                            style: TextStyle(fontSize: 14.sp)),
                        Text("Start: ${tripModel.startDate}",
                            style: TextStyle(fontSize: 14.sp)),
                        Text("End: ${tripModel.endDate}",
                            style: TextStyle(fontSize: 14.sp)),
                      ],
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        tripModel.images?.mainImage ?? '',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    trailing: Text("\$${tripModel.price}",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  ),
                );
              } else if (booking['type'] == 'CarBooking') {
                CarTripModel tripModel =
                    CarTripModel.fromJson(controller.data[index]);
                return Card(
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    title: Text(
                      "Car: ${tripModel.carType ?? 'Unknown'}",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text("From: ${tripModel.receivePlace}",
                            style: TextStyle(fontSize: 14.sp)),
                        Text("To: ${tripModel.returnPlace}",
                            style: TextStyle(fontSize: 14.sp)),
                        Text("Persons: ${tripModel.numberOfPersons}",
                            style: TextStyle(fontSize: 14.sp)),
                      ],
                    ),
                    trailing: Text("Status: ${tripModel.state}",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  ),
                );
              } else if (booking['type'] == 'PackageBooking') {
                PackageTripModel tripModel =
                    PackageTripModel.fromJson(controller.data[index]);
                return Card(
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    title: Text("Package Booking",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text("Persons: ${tripModel.numberOfPersons}",
                            style: TextStyle(fontSize: 14.sp)),
                        Text(
                            "Car: ${tripModel.addCar ?? false ? 'Included' : 'Not Included'}",
                            style: TextStyle(fontSize: 14.sp)),
                        Text(
                            "Guide: ${tripModel.addGuide ?? false ? 'Included' : 'Not Included'}",
                            style: TextStyle(fontSize: 14.sp)),
                      ],
                    ),
                    trailing: Text("Language: ${tripModel.language}",
                        style: TextStyle(fontSize: 14.sp)),
                  ),
                );
              } else if (booking['type'] == 'TourGuideBooking') {
                GuideTripModel tripModel =
                    GuideTripModel.fromJson(controller.data[index]);
                return Card(
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    title: Text("Tour Guide Booking",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text("From: ${tripModel.startPlace}",
                            style: TextStyle(fontSize: 14.sp)),
                        Text("To: ${tripModel.endPlace}",
                            style: TextStyle(fontSize: 14.sp)),
                        Text("Destinations: ${tripModel.destinations}",
                            style: TextStyle(fontSize: 14.sp)),
                      ],
                    ),
                    trailing: Text("\$${tripModel.price}",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  ),
                );
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