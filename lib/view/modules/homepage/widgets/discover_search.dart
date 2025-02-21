import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/discover_cubit.dart';
import 'package:sizer/sizer.dart';

class DiscoverSearch extends StatelessWidget {
  final DiscoverCubit controller;
  const DiscoverSearch({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.secondColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      width: 100.w,
      height: 11.h,
      child: Center(
        child: Form(
          key: controller.key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: controller.search,
              cursorColor: AppColor.secondColor,
              style: const TextStyle(fontSize: 16, color: AppColor.secondColor),
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColor.secondColor,
                    size: 27,
                  ),
                  hintText: "Search",
                  hintStyle:
                      TextStyle(fontSize: 16, color: AppColor.secondColor),
                  contentPadding: EdgeInsets.only(left: 30, right: 30),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.secondColor2, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
        ),
      ),
    );
  }
}
