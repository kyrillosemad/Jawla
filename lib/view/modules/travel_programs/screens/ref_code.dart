import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/travel_programs/ref_code_cubit.dart';
import 'package:sizer/sizer.dart';

class RefCode extends StatelessWidget {
  const RefCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RefCodeCubit(),
        child: Builder(
          builder: (context) {
            RefCodeCubit controller = context.read<RefCodeCubit>();
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    const Text(
                      "Don't Close This Page",
                      style: TextStyle(
                          fontSize: 22,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Image(image: AssetImage(AppImages().refCode)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Ref Code",
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      controller.response,
                      style: const TextStyle(
                          fontSize: 35,
                          color: AppColor.secondColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      width: 80.w,
                      child: const Text(
                        "If you have already paid, click Check and the verification and reservation will be done",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, color: AppColor.primaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        controller.checkPayment(context);
                      },
                      child: Container(
                          decoration: const BoxDecoration(
                              color: AppColor.secondColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: 80.w,
                          height: 7.h,
                          child: BlocBuilder<RefCodeCubit, AppState>(
                            builder: (context, state) {
                              if (state is Loading) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColor.primaryColor,
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: Text(
                                    "Check",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                );
                              }
                            },
                          )),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
