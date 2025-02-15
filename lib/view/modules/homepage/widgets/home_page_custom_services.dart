import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class HomePageCustomServices extends StatelessWidget {
  const HomePageCustomServices({super.key});

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
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 32.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        const Icon(
                          Icons.car_repair,
                          size: 33,
                          color: AppColor.secondColor,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const Text(
                          "Car",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
