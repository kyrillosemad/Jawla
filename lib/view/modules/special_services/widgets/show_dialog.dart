import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';

void showInfoDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), 
      ),
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      content: Text(
        content,
        textAlign: TextAlign.center, 
        style: const TextStyle(
          color: AppColor.secondColor,
          fontSize: 16,
          height: 1.5,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center, 
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColor.primaryColor, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              'Close',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    ),
  );
}
