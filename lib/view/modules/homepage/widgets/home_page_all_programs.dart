import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/favorite_cubit.dart';
import 'package:jawla/view%20model/homepage/homepage_cubit.dart';
import 'package:jawla/view/modules/homepage/widgets/home_page_program_widget.dart';
import 'package:sizer/sizer.dart';

class HomePageAllPrograms extends StatelessWidget {
  final HomePageCubit homePageCubit;
  final FavoriteCubit favoriteController;
  const HomePageAllPrograms(
      {super.key,
      required this.homePageCubit,
      required this.favoriteController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 29.h,
      decoration: const BoxDecoration(
          color: AppColor.secondColor,
          borderRadius: BorderRadius.only(topRight: Radius.elliptical(80, 35))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: const Text(
              "All Programs",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          HomePageProgramWidget(
              homePageCubit: homePageCubit,
              favoriteController: favoriteController),
        ],
      ),
    );
  }
}
