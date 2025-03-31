import 'package:flutter/material.dart';
import 'package:jawla/view%20model/travel_programs/payment_method_cubit.dart';
import 'package:sizer/sizer.dart';

class PaymentMethodImageWidget extends StatelessWidget {
  final PaymentMethodCubit controller;
  const PaymentMethodImageWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 95.w,
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: NetworkImage("${controller.mainImage}"),
                fit: BoxFit.fill)),
        child: Stack(
          children: [Positioned(bottom: 2.h, right: 7.5.w, child: Container())],
        ),
      ),
    );
  }
}
