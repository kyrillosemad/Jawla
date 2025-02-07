import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/view%20model/on_boarding_cubit.dart';
import 'package:jawla/view/modules/onboarding/widgets/J_logo.dart';
import 'package:jawla/view/modules/onboarding/widgets/choose_lang.dart';
import 'package:jawla/view/modules/onboarding/widgets/custom_button.dart';
import 'package:jawla/view/modules/onboarding/widgets/white_ellipse.dart';
import 'package:jawla/view/modules/onboarding/widgets/white_pyramids.dart';
import 'package:jawla/view/modules/onboarding/widgets/yellow_ellipse.dart';
import 'package:jawla/view/modules/onboarding/widgets/yellow_pyramids.dart';
import 'package:sizer/sizer.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<OnBoardingCubit>();
            return Scaffold(
              backgroundColor: AppColor.secondColor,
              body: Stack(children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            AppImages().bj1,
                          ),
                          fit: BoxFit.cover,
                          opacity: 0.1)),
                ),
                Positioned(
                    top: 12.h,
                    left: 10.w,
                    child: const SizedBox(
                        child: Text(
                      "SELECT \nLANGUAGE",
                      style: TextStyle(
                          fontSize: 35,
                          letterSpacing: 5,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w400),
                    ))),
                ChooseLang(controller: controller),
                const JLogo(),
                const WhitePyramids(),
                const YellowPyramids(),
                const YellowEllipse(),
                const WhiteEllipse(),
                CustomButton(
                  controller: controller,
                  name: "CONTINUE >>",
                  function: () {
                    controller.goToOnBoarding3();
                  },
                )
              ]),
            );
          },
        ));
  }
}
