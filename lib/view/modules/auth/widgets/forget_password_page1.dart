import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/text_styles.dart';
import 'package:jawla/core/functions/validator.dart';
import 'package:jawla/view%20model/auth/forget_password_cubit.dart';
import 'package:jawla/view/modules/auth/widgets/auth_custom_button.dart';
import 'package:jawla/view/modules/auth/widgets/auth_page_title.dart';
import 'package:jawla/view/modules/auth/widgets/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

class ForgetPasswordPage1 extends StatelessWidget {
  final ForgetPasswordCubit controller;
  const ForgetPasswordPage1({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.only(left: 10, right: 10, top: 13.h, bottom: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthPageTitle(
            name: "Forget Password",
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
              "Enter Your Email Now \nTo Receive A Verification Code",
              textAlign: TextAlign.center,
              style: AppTextStyles().mainBodies,
            ),
          ),
          SizedBox(
            height: 9.h,
          ),
          CustomTextFormField(
            controller: controller.emailCont,
            hintText: "Enter your Email",
            icon: Icons.email,
            labelText: "Email",
            obsecure: false,
            textInputType: TextInputType.name,
            validator: (value) {
              validator(value, 50, 13, "email");

              return null;
            },
            function: () {},
          ),
          SizedBox(
            height: 6.h,
          ),
          AuthCustomButton(
              function: () {
                controller.goToCheckEmail();
              },
              name: "Check")
        ],
      ),
    );
  }
}
