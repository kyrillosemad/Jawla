import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/travel_programs/payment_method_cubit.dart';

walletDialog(PaymentMethodCubit controller, BuildContext context) {
  Get.defaultDialog(
    title: "Wallet Number",
    titleStyle: const TextStyle(
      color: AppColor.primaryColor,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: AppColor.secondColor,
    radius: 15,
    content: Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller.walletCont,
        decoration: const InputDecoration(
          labelText: "Enter Wallet Number",
          labelStyle: TextStyle(color: AppColor.secondColor),
          prefixIcon: Icon(Icons.wallet, color: AppColor.secondColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
      ),
    ),
    textConfirm: "Confirm",
    confirmTextColor: AppColor.secondColor,
    buttonColor: AppColor.primaryColor,
    onConfirm: () {
      controller.payWithWallet(context, controller.walletCont.text.toString());
    },
    textCancel: "Cancel",
    cancelTextColor: AppColor.primaryColor,
  );
}
