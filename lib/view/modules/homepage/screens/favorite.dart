import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/favorite_cubit.dart';
import 'package:jawla/view%20model/homepage/trip_cubit.dart';
import 'package:jawla/view/modules/homepage/widgets/favorite_program_widget.dart';
import 'package:jawla/view/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TripCubit(),
          ),
        ],
        child: Builder(
          builder: (context) {
            var favoriteController = context.read<FavoriteCubit>();
            var tripController = context.read<TripCubit>();
            favoriteController.getFavoriteFun();
            return Scaffold(
              appBar: const CustomAppbar(),
              backgroundColor: AppColor.secondColor,
              body: Center(
                child: SizedBox(
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
                      SizedBox(
                        height: 3.h,
                      ),
                      Expanded(
                          child: FavoriteProgramWidget(
                              favoriteController: favoriteController,
                              tripController: tripController))
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
