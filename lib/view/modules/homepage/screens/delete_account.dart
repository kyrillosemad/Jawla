import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/lottie.dart';
import 'package:jawla/core/functions/validator.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/homepage/delete_account_cubit.dart';
import 'package:jawla/view/modules/homepage/widgets/custom_text.dart';
import 'package:jawla/view/widgets/custom_appbar.dart';
import 'package:jawla/view/widgets/custom_text_form_field.dart';
import 'package:jawla/view/widgets/warning_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DeleteAccountCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<DeleteAccountCubit>();
            return Scaffold(
              backgroundColor: AppColor.secondColor,
              appBar: const CustomAppbar(),
              body: SingleChildScrollView(
                child: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: Column(
                    children: [
                      const CustomText(name: "Delete Account"),
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                        child: Text(
                          "Are you sure you want to do this ? \n\nDeleting your account will remove all of your content and data associated with your jawla profile. ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Form(
                            key: controller.formKey,
                            child: CustomTextFormField(
                                controller: controller.passwordCont,
                                hintText: "Enter your password",
                                icon: Icons.password,
                                labelText: "Password",
                                obsecure: false,
                                textInputType: TextInputType.name,
                                validator: (value) {
                                  return validator(value, 50, 4, "password");
                                },
                                function: () {}),
                          )),
                      SizedBox(height: 40.h),
                      BlocConsumer<DeleteAccountCubit, AppState>(
                        listener: (context, state) {
                          if (state is InternetError) {
                            warningWidget(
                                "Connection Error",
                                Icons.wifi_off_rounded,
                                "Please check your internet connection and try again.");
                          } else if (state is ServerError) {
                            warningWidget("Server Error", Icons.cloud_off,
                                "Please check your server connection and try again.");
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
                          return MaterialButton(
                            onPressed: () {
                              controller.formKey.currentState!.validate()
                                  ? controller.deleteProfileFun()
                                  : () {};
                            },
                            child: Container(
                              width: 90.w,
                              height: 7.h,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [Colors.white, Colors.red]),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                      color: AppColor.secondColor,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
