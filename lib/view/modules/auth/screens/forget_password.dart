import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/auth/forget_password_cubit.dart';
import 'package:jawla/view/widgets/custom_appbar.dart';
import 'package:jawla/view/modules/auth/widgets/forget_password_page1.dart';
import 'package:jawla/view/modules/auth/widgets/forget_password_page2.dart';
import 'package:jawla/view/modules/auth/widgets/forget_password_page3.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: Builder(
        builder: (context) {
          var controller = context.read<ForgetPasswordCubit>();
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColor.secondColor,
              appBar: const CustomAppbar(),
              body: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 70.h,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      children: [
                        ForgetPasswordPage1(controller: controller),
                        ForgetPasswordPage2(controller: controller),
                        ForgetPasswordPage3(controller: controller),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SmoothPageIndicator(
                      controller: controller.pageController,
                      count: 3,
                      effect: const JumpingDotEffect(
                          dotColor: Colors.white,
                          activeDotColor: AppColor.primaryColor)),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
