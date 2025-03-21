import 'package:flutter/material.dart';
import 'package:jawla/view%20model/homepage/homepage_cubit.dart';
import 'package:jawla/view/modules/homepage/widgets/home_page_program_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/colors.dart';

class HomePageComeToEnd extends StatelessWidget {
  final HomePageCubit controller;
  const HomePageComeToEnd({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100.w,
        height: 27.h,
        child: Stack(
          children: [
            Container(
              width: 100.w,
              height: 20.h,
              color: AppColor.secondColor3,
            ),
            Container(
              width: 100.w,
              height: 27.h,
              decoration: const BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.elliptical(80, 35))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: const Text(
                      "Come To End",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  HomePageProgramWidget(
                    controller: controller,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
