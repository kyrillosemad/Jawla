import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/functions/validator.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/special_services/special_services_cubit.dart';
import 'package:jawla/view/modules/special_services/widgets/date_time_picker.dart';
import 'package:jawla/view/modules/special_services/widgets/pick_function.dart';
import 'package:jawla/view/widgets/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

class TourGuidePage extends StatelessWidget {
  final SpecialServicesCubit controller;
  const TourGuidePage({super.key, required this.controller});

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
                controller: controller.guideStartPlace,
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
                controller: controller.guideEndPlace,
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
                controller: controller.guideLanguage,
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
              SizedBox(height: 2.h),
              CustomTextFormField(
                controller: controller.guideDestinations,
                hintText: "Enter destinations details",
                icon: Icons.map,
                labelText: "destinations",
                obsecure: false,
                textInputType: TextInputType.name,
                validator: (value) {
                  return validator(value, 2, 1, "Enter a valid destinations");
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
                      dateTime: controller.guideStartDate,
                      onTap: () async {
                        DateTime? pickedDateTime = await pickDateTime(context);
                        if (pickedDateTime != null) {
                          controller.updateGuideStartDate(pickedDateTime);
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: buildDateTimePicker(
                      context,
                      title: "End Date & Time",
                      dateTime: controller.guideEndDate,
                      onTap: () async {
                        DateTime? pickedDateTime = await pickDateTime(context);
                        if (pickedDateTime != null) {
                          controller.updateGuideEndDate(pickedDateTime);
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
                      controller.confirmGuideBooking();
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
