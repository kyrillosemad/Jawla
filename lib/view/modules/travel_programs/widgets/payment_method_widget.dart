import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/travel_programs/payment_method_cubit.dart';
import 'package:sizer/sizer.dart';

class PaymentMethodWidget extends StatelessWidget {
  final PaymentMethodCubit controller;
  final String name;
  final DecorationImage? image;
  final void Function()? function;
  const PaymentMethodWidget(
      {super.key,
      required this.controller,
      required this.name,
      required this.image,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 92.w,
      height: 5.h,
      decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 10.w,
                height: 4.h,
                decoration: BoxDecoration(image: image),
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppColor.secondColor),
              )
            ],
          ),
          IconButton(
              onPressed: function,
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 25,
                color: AppColor.secondColor,
              ))
        ],
      ),
    );
  }
}
