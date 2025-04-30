import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/lottie.dart';
import 'package:jawla/core/constants/variable.dart';
import 'package:jawla/core/functions/validator.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/homepage/change_account_data_cubit.dart';
import 'package:jawla/view/modules/auth/widgets/auth_custom_button.dart';
import 'package:jawla/view/modules/homepage/widgets/custom_text.dart';
import 'package:jawla/view/widgets/custom_appbar.dart';
import 'package:jawla/view/widgets/custom_text_form_field.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../widgets/warning_widget.dart';

class ChangeAccountData extends StatelessWidget {
  const ChangeAccountData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ChangeAccountDataCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<ChangeAccountDataCubit>();
            controller.newEmailCont.text = Variable().email;
            controller.newNameCont.text = Variable().username;
            controller.newPhoneCont.text = Variable().phone;
            return Scaffold(
              backgroundColor: AppColor.secondColor,
              appBar: const CustomAppbar(),
              body: SingleChildScrollView(
                child: SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: Column(
                    children: [
                      const CustomText(name: "Change Account Info"),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                CustomTextFormField(
                                    controller: controller.newNameCont,
                                    hintText: "Enter New Username",
                                    icon: Icons.person,
                                    labelText: "username",
                                    obsecure: false,
                                    textInputType: TextInputType.name,
                                    validator: (value) {
                                      return validator(
                                          value, 50, 4, "username");
                                    },
                                    function: () {}),
                                SizedBox(
                                  height: 3.h,
                                ),
                                CustomTextFormField(
                                    controller: controller.newEmailCont,
                                    hintText: "Enter New Email",
                                    icon: Icons.email,
                                    labelText: "Email",
                                    obsecure: false,
                                    textInputType: TextInputType.name,
                                    validator: (value) {
                                      return validator(value, 50, 10, "email");
                                    },
                                    function: () {}),
                                SizedBox(
                                  height: 3.h,
                                ),
                                CustomTextFormField(
                                    controller: controller.newPhoneCont,
                                    hintText: "Enter New Phone",
                                    icon: Icons.phone,
                                    labelText: "Phone",
                                    obsecure: false,
                                    textInputType: TextInputType.number,
                                    validator: (value) {
                                      return validator(
                                          value, 50, 4, "password");
                                    },
                                    function: () {}),
                                SizedBox(height: 37.h),
                                BlocConsumer<ChangeAccountDataCubit, AppState>(
                                  listener: (context, state) {
                                    if (state is InternetError) {
                                      
                                      warningWidget(
                                          "Connection Error",
                                          Icons.wifi_off_rounded,
                                          "Please check your internet connection and try again.");
                                    } else if (state is ServerError) {
                                     
                                      warningWidget(
                                          "Server Error",
                                          Icons.cloud_off,
                                          "Please check your server connection and try again.");
                                    } else if (state is ApiFailure) {
                                     
                                      warningWidget("Wrong", Icons.error,
                                          "${state.error}");
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
                                          controller.formKey.currentState!
                                                  .validate()
                                              ? controller
                                                  .changeAccountDataFun()
                                              : () {};
                                        },
                                        name: "Save");
                                  },
                                )
                              ],
                            )),
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
