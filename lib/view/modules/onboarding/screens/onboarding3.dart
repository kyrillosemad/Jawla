import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/view%20model/onboarding/on_boarding_cubit.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding3_page1.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding3_page2.dart';
import 'package:jawla/view/modules/onboarding/widgets/logo.dart';
import 'package:jawla/view/modules/onboarding/widgets/white_pyramids.dart';
import 'package:jawla/view/modules/onboarding/widgets/yellow_pyramids.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Builder(
        builder: (context) {
          var controller = context.read<OnBoardingCubit>();

          return Scaffold(
            backgroundColor: AppColor.secondColor,
            body: Stack(
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages().bj2),
                      fit: BoxFit.fill,
                      opacity: 0.2,
                    ),
                  ),
                ),
                const Logo(),
                Positioned(
                  top: 15.h,
                  child: SizedBox(
                    width: 100.w,
                    height: 70.h,
                    child: PageView(
                      controller: controller.pageController,
                      children: [
                        OnBoarding3Page1(controller: controller),
                        OnBoarding3Page2(controller: controller),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 85.h,
                  child: SizedBox(
                    width: 100.w,
                    height: 10.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.goToPreviousPage();
                          },
                          child: Container(
                            width: 15.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.secondColor2,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 25.w),
                        SmoothPageIndicator(
                          controller: controller.pageController,
                          count: 2,
                          effect: const JumpingDotEffect(
                            dotColor: Colors.white,
                            activeDotColor: AppColor.primaryColor,
                            dotHeight: 12,
                            dotWidth: 12,
                          ),
                        ),
                        SizedBox(width: 25.w),
                        InkWell(
                          onTap: () {
                            controller.goToNextPage();
                          },
                          child: Container(
                            width: 15.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.secondColor2,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const WhitePyramids(),
                const YellowPyramids(),
              ],
            ),
          );
        },
      ),
    );
  }
}
