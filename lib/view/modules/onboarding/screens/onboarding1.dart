import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/view%20model/on_boarding_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColor.secondColor,
            body: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Stack(
                children: [
                  Positioned(
                    width: 80.w,
                    height: 35.h,
                    top: 7.h,
                    left: 5.w,
                    child: Image.asset(AppImages().circle, fit: BoxFit.fill),
                  ),
                  Positioned(
                      child: Container(
                    width: 60.w,
                    height: 7.h,
                    color: Colors.red,
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
