import 'package:flutter/material.dart';
import 'package:get/get.dart';

successWidget(String title, String content) {
  Get.closeAllSnackbars();
  Get.snackbar(
    title,
    content,
    snackPosition: SnackPosition.BOTTOM,
    backgroundGradient: const LinearGradient(
      colors: [Color.fromARGB(255, 135, 229, 139), Color(0xFF00A000)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.4, 0.9],
    ),
    boxShadows: [
      BoxShadow(
        color: Colors.green.withOpacity(0.4),
        blurRadius: 5,
        spreadRadius: 1,
        offset: const Offset(0, 2),
      ),
    ],
    colorText: Colors.black,
    icon: const Icon(Icons.check_circle, color: Colors.white, size: 24),
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    borderRadius: 8,
    duration: const Duration(milliseconds: 1800),
    animationDuration: const Duration(milliseconds: 400),
    overlayBlur: 0,
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
