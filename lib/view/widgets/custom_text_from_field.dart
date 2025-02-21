import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField2 extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool obsecure;
  final TextInputType? textInputType;
  final String labelText;
  final String hintText;
  final IconData? icon;
  final void Function()? function;
  const CustomTextFormField2(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon,
      required this.labelText,
      required this.obsecure,
      required this.textInputType,
      required this.validator,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obsecure,
      keyboardType: textInputType,
      style: const TextStyle(color: AppColor.primaryColor),
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(
            color: AppColor.primaryColor,
          ),
          contentPadding: const EdgeInsets.only(left: 35, top: 35),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          hintText: hintText,
          hintStyle: TextStyle(color: AppColor.primaryColor.withOpacity(0.6)),
          suffixIcon: IconButton(
            onPressed: function,
            icon: Icon(
              icon,
              color: AppColor.primaryColor,
              size: 25.sp,
            ),
          )),
    );
  }
}
