import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/view%20model/onboarding/on_boarding_cubit.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding3_page1.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding3_page2.dart';
import 'package:jawla/view/modules/onboarding/widgets/logo.dart';
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
            body: SafeArea(
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages().bj2),
                    fit: BoxFit.cover,
                    opacity: 0.2,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 3.h),
                    const Logo(),
                    Expanded(
                      child: PageView(
                        controller: controller.pageController,
                        children: [
                          OnBoarding3Page1(controller: controller),
                          OnBoarding3Page2(controller: controller),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildNavButton(
                            icon: Icons.arrow_back_ios,
                            onTap: controller.goToPreviousPage,
                          ),
                          SizedBox(width: 20.w),
                          SmoothPageIndicator(
                            controller: controller.pageController,
                            count: 2,
                            effect: const JumpingDotEffect(
                              dotColor: Colors.white,
                              activeDotColor: AppColor.primaryColor,
                              dotHeight: 10,
                              dotWidth: 10,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          _buildNavButton(
                            icon: Icons.arrow_forward_ios,
                            onTap: controller.goToNextPage,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 15.w,
        height: 6.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.secondColor2,
        ),
        child: Center(
          child: Icon(icon, size: 24, color: Colors.white),
        ),
      ),
    );
  }
}