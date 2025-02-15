import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/view%20model/travel_programs/success_page_cubit.dart';
import 'package:sizer/sizer.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SuccessPageCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<SuccessPageCubit>();
            return Scaffold(
              backgroundColor: AppColor.secondColor,
              body: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Column(
                  children: [
                    SizedBox(
                      height: 17.h,
                    ),
                    Container(
                      width: 90.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages().successLogo))),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    const Text(
                      "Congratulations",
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Text(
                      "Enjoy Your trip with us",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.goToHomePage();
                      },
                      child: Container(
                        width: 85.w,
                        height: 6.h,
                        decoration: const BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: const Center(
                          child: Text(
                            "OK",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.secondColor),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
