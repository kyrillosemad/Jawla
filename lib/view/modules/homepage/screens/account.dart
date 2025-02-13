import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/account_cubit.dart';
import 'package:sizer/sizer.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColor.secondColor,
        body: Container(width: 100.w),
      )),
    );
  }
}