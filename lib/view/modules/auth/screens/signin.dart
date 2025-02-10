import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/functions/validator.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/auth/signin_cubit.dart';
import 'package:jawla/view/modules/auth/screens/auth_custom_text.dart';
import 'package:jawla/view/modules/auth/widgets/auth_custom_button.dart';
import 'package:jawla/view/modules/auth/widgets/auth_page_title.dart';
import 'package:jawla/view/modules/auth/widgets/custom_text_form_field.dart';
import 'package:jawla/view/modules/auth/widgets/forget_password_button.dart';
import 'package:jawla/view/modules/auth/widgets/auth_logo_widget.dart';
import 'package:sizer/sizer.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SignInCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<SignInCubit>();
            return SafeArea(
              child: Scaffold(
                backgroundColor: AppColor.secondColor,
                body: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: 100.w,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AuthLogoWidget(),
                          SizedBox(
                            height: 3.h,
                          ),
                          const AuthPageTitle(name: "Log In"),
                          SizedBox(
                            width: 70.w,
                            child: const Divider(
                              thickness: 3,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Center(
                            child: SizedBox(
                              child: Form(
                                  key: controller.signInKey,
                                  child: Column(
                                    children: [
                                      CustomTextFormField(
                                        function: () {},
                                        controller: controller.userNameCont,
                                        hintText: "Enter your username",
                                        icon: Icons.person,
                                        labelText: "User name",
                                        obsecure: false,
                                        textInputType: TextInputType.name,
                                        validator: (value) {
                                          validator(value, 20, 3, "username");
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      BlocBuilder<SignInCubit, AppState>(
                                        builder: (context, state) {
                                          return CustomTextFormField(
                                            function: () {
                                              controller.changeSecure();
                                            },
                                            controller: controller.passwordCont,
                                            hintText: "Enter your password",
                                            icon: controller.securepassword ==
                                                    true
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            labelText: "Password",
                                            obsecure: controller.securepassword,
                                            textInputType: TextInputType.name,
                                            validator: (value) {
                                              validator(
                                                  value, 20, 3, "password");
                                              return null;
                                            },
                                          );
                                        },
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          ForgetPasswordButton(controller: controller),
                          SizedBox(
                            height: 5.h,
                          ),
                          AuthCustomButton(function: () {}, name: "Sign In"),
                          SizedBox(
                            height: 8.h,
                          ),
                          AuthCustomText(
                              function: () {
                                controller.goToSignup();
                              },
                              text1: "Don’t have an account ?",
                              text2: " Registration")
                        ]),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
