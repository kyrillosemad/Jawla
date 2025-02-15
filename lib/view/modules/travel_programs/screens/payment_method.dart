import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/view%20model/travel_programs/payment_method_cubit.dart';
import 'package:jawla/view/modules/travel_programs/widgets/custom_container.dart';
import 'package:jawla/view/modules/travel_programs/widgets/payment_method_image_widget.dart';
import 'package:jawla/view/modules/travel_programs/widgets/payment_method_widget.dart';
import 'package:jawla/view/widgets/custom_appbar.dart';
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
              body: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Column(
                  children: [
                    const CustomAppbar(),
                    const Text(
                      "Review Order",
                      style:
                          TextStyle(fontSize: 22, color: AppColor.primaryColor),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const PaymentMethodImageWidget(),
                    SizedBox(
                      height: 2.h,
                    ),
                    const CustomContainer(
                        widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order Id",
                          style: TextStyle(
                              color: AppColor.secondColor, fontSize: 16),
                        ),
                        Text(
                          "**********7",
                          style: TextStyle(
                              color: AppColor.secondColor, fontSize: 16),
                        )
                      ],
                    )),
                    SizedBox(
                      height: 1.h,
                    ),
                    const CustomContainer(
                        widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Amount",
                          style: TextStyle(
                              color: AppColor.secondColor, fontSize: 16),
                        ),
                        Text(
                          "2",
                          style: TextStyle(
                              color: AppColor.secondColor, fontSize: 16),
                        )
                      ],
                    )),
                    SizedBox(
                      height: 1.h,
                    ),
                    const CustomContainer(
                        widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              color: AppColor.secondColor, fontSize: 16),
                        ),
                        Text(
                          "500 L.E",
                          style: TextStyle(
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
                      style:
                          TextStyle(fontSize: 20, color: AppColor.primaryColor),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    PaymentMethodWidget(
                      image: DecorationImage(
                          image: AssetImage(AppImages().paypalLogo)),
                      controller: controller,
                      name: "PayPal",
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
