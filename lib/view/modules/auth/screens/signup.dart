import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/lottie.dart';
import 'package:jawla/core/functions/validator.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/auth/signup_cubit.dart';
import 'package:jawla/view/modules/auth/screens/auth_custom_text.dart';
import 'package:jawla/view/modules/auth/widgets/auth_custom_button.dart';
import 'package:jawla/view/modules/auth/widgets/auth_logo_widget.dart';
import 'package:jawla/view/modules/auth/widgets/auth_page_title.dart';
import 'package:jawla/view/widgets/warning_widget.dart';
import 'package:jawla/view/widgets/custom_text_form_field.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SignupCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<SignupCubit>();
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
                      const AuthPageTitle(name: "Sign Up"),
                      SizedBox(
                        width: 70.w,
                        child: const Divider(
                          thickness: 3,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Form(
                          key: controller.signUpKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                controller: controller.userNameCont,
                                hintText: "Enter your username",
                                icon: Icons.person,
                                labelText: "User name",
                                obsecure: false,
                                textInputType: TextInputType.name,
                                validator: (value) {
                                  return validator(value, 20, 3, "username");
                                },
                                function: () {},
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              CustomTextFormField(
                                function: () {},
                                controller: controller.emailCont,
                                hintText: "Enter your email",
                                icon: Icons.email,
                                labelText: "Email",
                                obsecure: false,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  return validator(value, 50, 13, "email");
                                },
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              BlocBuilder<SignupCubit, AppState>(
                                builder: (context, state) {
                                  return Column(
                                    children: [
                                      CustomTextFormField(
                                        function: () {
                                          controller.changeSecure();
                                        },
                                        controller: controller.passwordCont,
                                        hintText: "Enter your password",
                                        icon: controller.securepassword == true
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        labelText: "Password",
                                        obsecure: controller.securepassword,
                                        textInputType: TextInputType.name,
                                        validator: (value) {
                                          return validator(
                                              value, 50, 3, "password");
                                        },
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      CustomTextFormField(
                                        function: () {},
                                        controller: controller.phoneCont,
                                        hintText: "Enter your phone",
                                        icon: Icons.phone,
                                        labelText: "Phone",
                                        obsecure:
                                            controller.secureConfirmedPassword,
                                        textInputType: TextInputType.number,
                                        validator: (value) {
                                          return validator(
                                              value, 50, 3, "password");
                                        },
                                      ),
                                    ],
                                  );
                                },
                              )
                            ],
                          )),
                      SizedBox(
                        height: 5.h,
                      ),
                      BlocConsumer<SignupCubit, AppState>(
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
                                controller.signUpKey.currentState!.validate()
                                    ? controller.signUpFun()
                                    : () {};
                              },
                              name: "Sign Up");
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      AuthCustomText(
                          function: () {
                            controller.goToSignin();
                          },
                          text1: "Already have an account?",
                          text2: " Login Here")
                    ],
                  ),
                ),
              ),
            ));
          },
        ));
  }
}
