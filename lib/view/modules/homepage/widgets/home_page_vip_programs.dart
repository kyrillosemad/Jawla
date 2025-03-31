import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/favorite_cubit.dart';
import 'package:jawla/view%20model/homepage/trip_cubit.dart';
import 'package:jawla/view/modules/homepage/widgets/home_page_vip_program_widget.dart';
import 'package:sizer/sizer.dart';

class HomePageVipPrograms extends StatelessWidget {
  final TripCubit tripController;
  final FavoriteCubit favoriteController;
  const HomePageVipPrograms({super.key, required this.tripController,required this.favoriteController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 27.h,
      decoration: const BoxDecoration(
          color: AppColor.secondColor,
          borderRadius: BorderRadius.only(topRight: Radius.elliptical(80, 35))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: const Text(
              "Vip Programs",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          HomePageVipProgramWidget(tripController: tripController, favoriteController: favoriteController),
        ],
      ),
    );
  }
}
