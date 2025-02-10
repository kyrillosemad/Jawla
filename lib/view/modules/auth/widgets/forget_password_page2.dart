import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/text_styles.dart';
import 'package:jawla/view%20model/auth/forget_password_cubit.dart';
import 'package:jawla/view/modules/auth/widgets/auth_custom_button.dart';
import 'package:jawla/view/modules/auth/widgets/auth_page_title.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ForgetPasswordPage2 extends StatelessWidget {
  final ForgetPasswordCubit controller;
  const ForgetPasswordPage2({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.only(left: 10, right: 10, top: 13.h, bottom: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthPageTitle(
            name: "Check Email",
          ),
          SizedBox(
            width: 75.w,
            child: const Divider(
              thickness: 3,
              color: AppColor.primaryColor,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: Text(
              "Enter Your Verification Code received on your e-mail to continue resetting your password",
              textAlign: TextAlign.center,
              style: AppTextStyles().mainBodies,
            ),
          ),
          SizedBox(
            height: 9.h,
          ),
          OtpTextField(
            fieldWidth: 50,
            filled: true,
            fillColor: const Color(0xFFD0D0D0),
            enabledBorderColor: AppColor.primaryColor,
            focusedBorderColor: AppColor.primaryColor,
            borderWidth: 2,
            borderRadius: BorderRadius.circular(15),
            numberOfFields: 5,
            showFieldAsBox: true,
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {},
          ),
          SizedBox(
            height: 6.h,
          ),
          AuthCustomButton(
              function: () {
                controller.goToNewPassword();
              },
              name: "Verify")
        ],
      ),
    );
  }
}
