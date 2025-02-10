import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/text_styles.dart';
import 'package:jawla/core/functions/validator.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/auth/forget_password_cubit.dart';
import 'package:jawla/view/modules/auth/widgets/auth_custom_button.dart';
import 'package:jawla/view/modules/auth/widgets/auth_page_title.dart';
import 'package:jawla/view/modules/auth/widgets/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

class ForgetPasswordPage3 extends StatelessWidget {
  final ForgetPasswordCubit controller;
  const ForgetPasswordPage3({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.only(left: 10, right: 10, top: 13.h, bottom: 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthPageTitle(
            name: "New Password",
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
              "Please Enter Your New Password ",
              textAlign: TextAlign.center,
              style: AppTextStyles().mainBodies,
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          BlocBuilder<ForgetPasswordCubit, AppState>(
            builder: (context, state) {
              return Column(
                children: [
                  Form(
                      key: controller.pageKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: controller.password1,
                            hintText: "Enter Your Password",
                            icon: controller.securePass1 == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                            labelText: "password",
                            obsecure: controller.securePass1,
                            textInputType: TextInputType.name,
                            validator: (value) {
                              validator(value, 50, 3, "password");
                              return null;
                            },
                            function: () {
                              controller.changeSecurePass1();
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomTextFormField(
                            controller: controller.password2,
                            hintText: "Confirm Your password",
                            icon: controller.securePass2 == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                            labelText: "password",
                            obsecure: controller.securePass2,
                            textInputType: TextInputType.name,
                            validator: (value) {
                              validator(value, 50, 3, "password");
                              return null;
                            },
                            function: () {
                              controller.changeSecurePass2();
                            },
                          ),
                        ],
                      )),
                ],
              );
            },
          ),
          SizedBox(
            height: 6.h,
          ),
          AuthCustomButton(function: () {}, name: "Save")
        ],
      ),
    );
  }
}
