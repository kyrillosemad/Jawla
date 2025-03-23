import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/functions/validator.dart';
import 'package:jawla/view%20model/homepage/change_name_cubit.dart';
import 'package:jawla/view/modules/auth/widgets/auth_custom_button.dart';
import 'package:jawla/view/modules/homepage/widgets/custom_text.dart';
import 'package:jawla/view/widgets/custom_appbar.dart';
import 'package:jawla/view/widgets/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ChangeNameCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<ChangeNameCubit>();
            return Scaffold(
              backgroundColor: AppColor.secondColor,
              appBar: const CustomAppbar(),
              body: SingleChildScrollView(
                child: SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: Column(
                    children: [
                      const CustomText(name: "Change Name"),
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
                                    hintText: "ENter New Username",
                                    icon: Icons.person,
                                    labelText: "username",
                                    obsecure: false,
                                    textInputType: TextInputType.name,
                                    validator: (value) {
                                      validator(value, 50, 4, "username");
                                      return null;
                                    },
                                    function: () {}),
                                SizedBox(
                                  height: 3.h,
                                ),
                                CustomTextFormField(
                                    controller: controller.passwordCont,
                                    hintText: "Enter your password",
                                    icon: Icons.password,
                                    labelText: "Password",
                                    obsecure: false,
                                    textInputType: TextInputType.name,
                                    validator: (value) {
                                      validator(value, 50, 4, "password");
                                      return null;
                                    },
                                    function: () {}),
                                SizedBox(
                                  height: 50.h,
                                ),
                                AuthCustomButton(function: () {}, name: "Save"),
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
