import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/homepage_cubit.dart';
import 'package:jawla/view/modules/homepage/widgets/special_services_widget.dart';
import 'package:sizer/sizer.dart';

class HomePageCustomServices extends StatelessWidget {
  final HomePageCubit controller;
  const HomePageCustomServices({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: const EdgeInsets.only(left: 10),
      height: 16.h,
      decoration: const BoxDecoration(
          color: AppColor.secondColor3,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(30),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.7.h,
          ),
          const Center(
            child: Text(
              "Special Services",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
              width: 98.w,
              height: 12.h,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SpecialServicesWidget(
                      function: () {
                        controller.index = 0;
                        controller.goToSpecialServices();
                      },
                      icon: Icons.local_taxi_rounded,
                      name: "Car"),
                  SpecialServicesWidget(
                      function: () {
                        controller.index = 1;
                        controller.goToSpecialServices();
                      },
                      icon: Icons.person,
                      name: "Tour Guide"),
                  SpecialServicesWidget(
                      function: () {
                        controller.index = 2;
                        controller.goToSpecialServices();
                      },
                      icon: Icons.workspace_premium,
                      name: "Custom Program"),
                ],
              )),
        ],
      ),
    );
  }
}
