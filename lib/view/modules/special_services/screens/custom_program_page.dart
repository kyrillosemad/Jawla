import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/functions/validator.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/special_services/special_services_cubit.dart';
import 'package:jawla/view/modules/special_services/widgets/date_time_picker.dart';
import 'package:jawla/view/modules/special_services/widgets/pick_function.dart';
import 'package:jawla/view/modules/special_services/widgets/show_dialog.dart';
import 'package:jawla/view/widgets/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

class CustomProgramPage extends StatelessWidget {
  final SpecialServicesCubit controller;
  const CustomProgramPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialServicesCubit, AppState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),
              CustomTextFormField(
                controller: controller.programStartPlace,
                hintText: "Enter Start Place",
                icon: Icons.place,
                labelText: "Start Place",
                obsecure: false,
                textInputType: TextInputType.text,
                validator: (value) {
                  return validator(value, 200, 2, "Enter a valid place");
                },
                function: () {},
              ),
              SizedBox(height: 2.h),
              CustomTextFormField(
                controller: controller.programEndPlace,
                hintText: "Enter End Place",
                icon: Icons.place_outlined,
                labelText: "End Place",
                obsecure: false,
                textInputType: TextInputType.text,
                validator: (value) {
                  return validator(value, 200, 2, "Enter a valid place");
                },
                function: () {},
              ),
              SizedBox(height: 2.h),
              CustomTextFormField(
                controller: controller.programDestinations,
                hintText: "Enter Destinations details",
                icon: Icons.map,
                labelText: "Destinations",
                obsecure: false,
                textInputType: TextInputType.text,
                validator: (value) {
                  return validator(value, 100, 2, "Enter a valid Destinations");
                },
                function: () {},
              ),
              SizedBox(height: 2.h),
              CustomTextFormField(
                controller: controller.programNumberOfPersons,
                hintText: "Enter Number of Persons",
                icon: Icons.people,
                labelText: "Number of Persons",
                obsecure: false,
                textInputType: TextInputType.number,
                validator: (value) {
                  return validator(value, 2, 1, "Enter a valid number");
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add Car",
                    style:
                        TextStyle(fontSize: 17, color: AppColor.primaryColor),
                  ),
                  Row(
                    children: [
                      BlocBuilder<SpecialServicesCubit, AppState>(
                        builder: (context, state) {
                          return Switch(
                            value: controller.haveCar,
                            activeTrackColor: AppColor.primaryColor,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: Colors.white,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              controller.changeHavingCar();
                            },
                          );
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            showInfoDialog(
                              context,
                              'Car Booking',
                              'When you activate this service, you will be provided with a private car for the entire duration of the trip.',
                            );
                          },
                          icon: const Icon(
                            Icons.info,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  )
                ],
              ),
              if (controller.haveCar == true)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: 90.w,
                  child: CustomTextFormField(
                    controller: controller.programCarType,
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
                ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add Guide",
                    style:
                        TextStyle(fontSize: 17, color: AppColor.primaryColor),
                  ),
                  Row(
                    children: [
                      BlocBuilder<SpecialServicesCubit, AppState>(
                        builder: (context, state) {
                          return Switch(
                            value: controller.haveGuide,
                            activeTrackColor: AppColor.primaryColor,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: Colors.white,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              controller.changeHavingGuide();
                            },
                          );
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            showInfoDialog(
                              context,
                              'Tour Guide Booking',
                              'When this service is activated, a specialized tour guide will be provided to accompany you during the tour.',
                            );
                          },
                          icon: const Icon(
                            Icons.info,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  )
                ],
              ),
              if (controller.haveGuide == true)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: 90.w,
                  child: CustomTextFormField(
                    controller: controller.programGuideLanguage,
                    hintText: "Enter Language",
                    icon: Icons.language,
                    labelText: "Language",
                    obsecure: false,
                    textInputType: TextInputType.text,
                    validator: (value) {
                      return validator(value, 100, 2, "Enter a valid language");
                    },
                    function: () {},
                  ),
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
                        DateTime? pickedDateTime = await pickDateTime(context);
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
                        DateTime? pickedDateTime = await pickDateTime(context);
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
                child: SizedBox(
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
                      controller.confirmProgramBooking();
                    },
                    child: const Text(
                      "Submit",
                      style:
                          TextStyle(fontSize: 18, color: AppColor.secondColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
