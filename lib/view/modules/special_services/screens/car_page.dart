// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/lottie.dart';
import 'package:jawla/core/functions/validator.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/special_services/car_service_cubit.dart';
import 'package:jawla/view%20model/special_services/special_services_cubit.dart';
import 'package:jawla/view/modules/special_services/widgets/date_time_picker.dart';
import 'package:jawla/view/modules/special_services/widgets/pick_function.dart';
import 'package:jawla/view/widgets/custom_text_form_field.dart';
import 'package:jawla/view/widgets/warning_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class CarPage extends StatelessWidget {
  final CarServiceCubit controller;
  const CarPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialServicesCubit, AppState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.h),
                CustomTextFormField(
                  controller: controller.carReceivePlace,
                  hintText: "Enter Receive Place",
                  icon: Icons.place,
                  labelText: "Receive Place",
                  obsecure: false,
                  textInputType: TextInputType.text,
                  validator: (value) {
                    return validator(value, 200, 2, "Enter a valid place");
                  },
                  function: () {},
                ),
                SizedBox(height: 2.h),
                CustomTextFormField(
                  controller: controller.carReturnPlace,
                  hintText: "Enter Return Place",
                  icon: Icons.place_outlined,
                  labelText: "Return Place",
                  obsecure: false,
                  textInputType: TextInputType.text,
                  validator: (value) {
                    return validator(value, 200, 2, "Enter a valid place");
                  },
                  function: () {},
                ),
                SizedBox(height: 2.h),
                CustomTextFormField(
                  controller: controller.carTypeOfCar,
                  hintText: "Enter Car Type",
                  icon: Icons.directions_car,
                  labelText: "Car Type",
                  obsecure: false,
                  textInputType: TextInputType.text,
                  validator: (value) {
                    return validator(value, 100, 2, "Enter a valid car type");
                  },
                  function: () {},
                ),
                SizedBox(height: 2.h),
                CustomTextFormField(
                  controller: controller.carNumberOfPersons,
                  hintText: "Enter Number of Persons",
                  icon: Icons.people,
                  labelText: "Number of Persons",
                  obsecure: false,
                  textInputType: TextInputType.number,
                  validator: (value) {
                    return validator(value, 10, 1, "Enter a valid number");
                  },
                  function: () {},
                ),
                SizedBox(height: 1.h),
                Center(
                  child: SizedBox(
                      width: 85.w,
                      child: const Divider(
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    Expanded(
                      child: buildDateTimePicker(
                        context,
                        title: "Start Date & Time",
                        dateTime: controller.carStartDate,
                        onTap: () async {
                          DateTime? pickedDateTime =
                              await pickDateTime(context);
                          if (pickedDateTime != null) {
                            controller.updateCarStartDate(pickedDateTime);
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: buildDateTimePicker(
                        context,
                        title: "End Date & Time",
                        dateTime: controller.carEndDate,
                        onTap: () async {
                          DateTime? pickedDateTime =
                              await pickDateTime(context);
                          if (pickedDateTime != null) {
                            controller.updateCarEndDate(pickedDateTime);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Center(
                    child: BlocConsumer<CarServiceCubit, AppState>(
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
                      return SizedBox(
                        width: 80.w,
                        height: 7.h,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: LottieBuilder.asset(AppLottie().loading)),
                      );
                    } else {
                      return SizedBox(
                        width: 80.w,
                        height: 7.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            controller.formKey.currentState!.validate()
                                ? controller.confirmCarBooking()
                                : () {};
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 18, color: AppColor.secondColor),
                          ),
                        ),
                      );
                    }
                  },
                )),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
