import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/favorite_cubit.dart';
import 'package:jawla/view/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FavoriteCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<FavoriteCubit>();
            return Scaffold(
              appBar: const CustomAppbar(),
              backgroundColor: AppColor.secondColor,
              body: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Column(
                  children: [
                    Text(
                      "Favorite",
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
