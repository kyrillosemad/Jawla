import 'package:flutter/material.dart';
import 'package:get/get.dart';

successWidget(String title, String content) {
  Get.closeAllSnackbars(); // إغلاق أي Snackbar مفتوحة
  Get.snackbar(
    title,
    content,
    snackPosition: SnackPosition.BOTTOM,
    backgroundGradient: const LinearGradient(
      colors: [
        Color.fromARGB(255, 135, 229, 139),
        Color(0xFF00A000)
      ], // لون أخضر واضح بدون شفافية
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.4, 0.9],
    ),
    boxShadows: [
      BoxShadow(
        color: Colors.green.withOpacity(0.4), // ظل خفيف
        blurRadius: 5,
        spreadRadius: 1,
        offset: const Offset(0, 2),
      ),
    ],
    colorText: Colors.black,
    icon: const Icon(Icons.check_circle,
        color: Colors.white, size: 24), // أيقونة أصغر
    margin:
        const EdgeInsets.symmetric(horizontal: 8, vertical: 10), // تقليل الحواف
    padding: const EdgeInsets.symmetric(
        horizontal: 10, vertical: 8), // تقليل الارتفاع
    borderRadius: 8, // حواف أقل تقوسًا
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 400),
    overlayBlur: 0, // إزالة التعتيم
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
