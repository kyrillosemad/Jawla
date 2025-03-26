import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/variable.dart';
import 'package:jawla/view%20model/homepage/settings_cubit.dart';
import 'package:jawla/view/modules/homepage/widgets/custom_row2.dart';
import 'package:jawla/view/modules/homepage/widgets/divider_widget.dart';
import 'package:jawla/view/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SettingsCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<SettingsCubit>();
            return Scaffold(
              appBar: const CustomAppbar(),
              backgroundColor: AppColor.secondColor,
              body: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Column(
                  children: [
                    Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      width: 95.w,
                      height: 72.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(colors: [
                            Colors.transparent,
                            Colors.transparent
                          ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomRow2(
                              onTap: () {
                                controller.goToChangeAccountData();
                              },
                              leadingIcon: Icons.person,
                              trailingIcon: Icons.arrow_forward_ios_outlined,
                              title: "Account Info",
                              content: Variable().username),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          const DividerWidget(),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          CustomRow2(
                              onTap: () {
                                controller.goToChangePassword();
                              },
                              leadingIcon: Icons.password,
                              trailingIcon: Icons.arrow_forward_ios_outlined,
                              title: "Change Password",
                              content: "***********"),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          const DividerWidget(),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          CustomRow2(
                              onTap: () {
                                controller.goToDeleteAccount();
                              },
                              leadingIcon: Icons.delete,
                              trailingIcon: Icons.arrow_forward_ios_outlined,
                              title: "Delete This Account",
                              content: "Delete"),
                          SizedBox(
                            height: 0.5.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
