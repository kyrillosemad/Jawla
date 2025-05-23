// lib/view/home/widgets/home_appbar_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/core/constants/variable.dart';
import 'package:jawla/view model/app_state.dart';
import 'package:jawla/view model/homepage/homepage_cubit.dart';
import 'package:sizer/sizer.dart';

class HomePageAppbar extends StatelessWidget {
  final HomePageCubit controller;
  const HomePageAppbar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: 100.w,
      height: 14.h,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        image: DecorationImage(
          image: AssetImage(AppImages().back4),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<HomePageCubit, AppState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return const Text(
                      "Hi, ...",
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColor.secondColor,
                      ),
                    );
                  }
                  return Text(
                    "Hi, ${Variable().username}",
                    style: const TextStyle(
                      fontSize: 17,
                      color: AppColor.secondColor,
                    ),
                  );
                },
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.list,
                  size: 27,
                  color: AppColor.secondColor,
                ),
              ),
            ],
          ),
          Center(
            child: Form(
              key: controller.searchKey,
              child: TextFormField(
                onChanged: (value) async {
                  await controller.getAllTrips(value.toString());
                },
                controller: controller.searchCont,
                cursorColor: AppColor.primaryColor,
                style: const TextStyle(fontSize: 16, color: Colors.white),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 27,
                  ),
                  label: Text("Search"),
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.only(left: 30, right: 30),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.secondColor2, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  fillColor: AppColor.secondColor,
                  filled: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
