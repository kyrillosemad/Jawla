import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/core/constants/lottie.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/travel_programs/payment_method_cubit.dart';
import 'package:jawla/view/modules/travel_programs/widgets/custom_container.dart';
import 'package:jawla/view/modules/travel_programs/widgets/payment_method_image_widget.dart';
import 'package:jawla/view/modules/travel_programs/widgets/payment_method_widget.dart';
import 'package:jawla/view/widgets/custom_appbar.dart';
import 'package:jawla/view/widgets/wallet_number_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PaymentMethodCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<PaymentMethodCubit>();
            return Scaffold(
              backgroundColor: AppColor.secondColor,
              body: SingleChildScrollView(
                child: SizedBox(
                  width: 100.w,
                  child: Column(
                    children: [
                      const CustomAppbar(),
                      const Text(
                        "Review Order",
                        style: TextStyle(
                            fontSize: 22, color: AppColor.primaryColor),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      PaymentMethodImageWidget(controller: controller),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomContainer(
                          widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Price",
                            style: TextStyle(
                                color: AppColor.secondColor, fontSize: 16),
                          ),
                          Text(
                            controller.price.toString(),
                            style: const TextStyle(
                                color: AppColor.secondColor, fontSize: 16),
                          )
                        ],
                      )),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomContainer(
                          widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Amount",
                            style: TextStyle(
                                color: AppColor.secondColor, fontSize: 16),
                          ),
                          Text(
                            controller.persons.toString(),
                            style: const TextStyle(
                                color: AppColor.secondColor, fontSize: 16),
                          )
                        ],
                      )),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomContainer(
                          widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                                color: AppColor.secondColor, fontSize: 16),
                          ),
                          Text(
                            "${controller.totalPrice} L.E",
                            style: const TextStyle(
                                color: AppColor.secondColor, fontSize: 16),
                          )
                        ],
                      )),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        width: 70.w,
                        child: const Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const Text(
                        "Payment Method",
                        style: TextStyle(
                            fontSize: 20, color: AppColor.primaryColor),
                      ),
                      BlocBuilder<PaymentMethodCubit, AppState>(
                        builder: (context, state) {
                          if (state is Loading) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Center(
                                  child: Lottie.asset(
                                      AppLottie().paymentLoading,
                                      height: 15.h),
                                )
                              ],
                            );
                          }
                          return Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              PaymentMethodWidget(
                                image: DecorationImage(
                                    image: AssetImage(AppImages().masterCard)),
                                controller: controller,
                                name: "Master Card",
                                function: () {
                                  controller.payWithCard(context);
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              PaymentMethodWidget(
                                function: () {
                                  walletDialog(controller, context);
                                },
                                image: DecorationImage(
                                    image: AssetImage(AppImages().E_Wallet)),
                                controller: controller,
                                name: "E_wallet",
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              PaymentMethodWidget(
                                image: DecorationImage(
                                    image: AssetImage(AppImages().refCode)),
                                controller: controller,
                                name: "Ref Code",
                                function: () {
                                  controller.payWithRefCodeFun();
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              PaymentMethodWidget(
                                image: DecorationImage(
                                    image: AssetImage(AppImages().paypal)),
                                controller: controller,
                                name: "payPal",
                                function: () {
                                  controller.payWithPaypalFun(context);
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
