import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/lottie.dart';
import 'package:jawla/core/functions/validator.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/auth/signin_cubit.dart';
import 'package:jawla/view/modules/auth/screens/auth_custom_text.dart';
import 'package:jawla/view/modules/auth/widgets/auth_custom_button.dart';
import 'package:jawla/view/modules/auth/widgets/auth_page_title.dart';
import 'package:jawla/view/widgets/warning_widget.dart';
import 'package:jawla/view/widgets/custom_text_form_field.dart';
import 'package:jawla/view/modules/auth/widgets/forget_password_button.dart';
import 'package:jawla/view/modules/auth/widgets/auth_logo_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';

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
                      SizedBox(height: 3.h),
                      const AuthPageTitle(name: "Log In"),
                      SizedBox(
                        width: 70.w,
                        child: const Divider(
                          thickness: 3,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
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
                                    return validator(value, 20, 3, "username");
                                  },
                                ),
                                SizedBox(height: 3.h),
                                BlocBuilder<SignInCubit, AppState>(
                                  builder: (context, state) {
                                    return CustomTextFormField(
                                      function: () {
                                        controller.changeSecure();
                                      },
                                      controller: controller.passwordCont,
                                      hintText: "Enter your password",
                                      icon: controller.securepassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      labelText: "Password",
                                      obsecure: controller.securepassword,
                                      textInputType: TextInputType.text,
                                      validator: (value) {
                                        return validator(
                                            value, 20, 3, "password");
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      ForgetPasswordButton(controller: controller),
                      SizedBox(height: 5.h),
                      BlocConsumer<SignInCubit, AppState>(
                        listener: (context, state) {
                          if (state is InternetError) {
                            warningWidget(
                                "Connection Error",
                                Icons.wifi_off_rounded,
                                "Please check your internet connection and try again.");
                          } else if (state is ServerError) {
                            warningWidget("Server Error", Icons.cloud_off,
                                "Please check your server connection and try again.");
                          } else if (state is ApiFailure) {
                            warningWidget(
                                "Wrong", Icons.error, "${state.error}");
                          }
                        },
                        builder: (context, state) {
                          if (state is Loading) {
                            return Center(
                                child: LottieBuilder.asset(
                              AppLottie().loading,
                              height: 80,
                            ));
                          }
                          return AuthCustomButton(
                            function: () {
                              controller.signInKey.currentState!.validate()
                                  ? controller.loginFun()
                                  : () {};
                            },
                            name: "Sign In",
                          );
                        },
                      ),
                      SizedBox(height: 8.h),
                      AuthCustomText(
                        function: () {
                          controller.goToSignup();
                        },
                        text1: "Don’t have an account?",
                        text2: " Registration",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
