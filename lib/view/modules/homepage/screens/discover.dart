import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/discover_cubit.dart';
import 'package:sizer/sizer.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscoverCubit(),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColor.secondColor,
        body: Container(width: 100.w),
      )),
    );
  }
}
