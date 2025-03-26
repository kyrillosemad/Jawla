import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:jawla/core/constants/colors.dart';

warningWidget(String title, IconData icon, String body) {
  Get.defaultDialog(
    title: title,
    titleStyle: const TextStyle(
        color: AppColor.primaryColor,
        fontSize: 22,
        fontWeight: FontWeight.bold),
    backgroundColor: AppColor.secondColor,
    radius: 15,
    content: Column(
      children: [
        Icon(
          icon,
          color: AppColor.thirdColor,
          size: 50,
        ),
        const SizedBox(height: 10),
        Text(
          body,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    ),
    confirm: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () => Get.back(),
      child: const Text(
        "OK",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
