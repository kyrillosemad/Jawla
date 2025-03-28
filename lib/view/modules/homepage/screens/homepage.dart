import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/homepage_cubit.dart';
import 'package:jawla/view%20model/homepage/trip_cubit.dart';
import 'package:jawla/view/modules/homepage/widgets/home_page_all_programs.dart';
import 'package:jawla/view/modules/homepage/widgets/home_page_appbar.dart';
import 'package:jawla/view/modules/homepage/widgets/home_page_custom_services.dart';
import 'package:jawla/view/modules/homepage/widgets/home_page_vip_programs.dart';
import 'package:jawla/view/modules/homepage/widgets/homepage_image.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/variable.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomePageCubit(),
          ),
          BlocProvider(
            create: (context) => TripCubit(),
          ),
        ],
        child: Builder(
          builder: (context) {
            var homePageController = context.read<HomePageCubit>();
            var tripController = context.read<TripCubit>();
            homePageController.getProfileInfo(Variable().token);
            tripController.getAllTrips();
            return SafeArea(
                child: Scaffold(
              backgroundColor: AppColor.secondColor,
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: SizedBox(
                  width: 100.w,
                  child: Column(
                    children: [
                      HomePageAppbar(controller: homePageController),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      const HomePageImage(),
                      SizedBox(
                        height: 1.h,
                      ),
                      HomePageCustomServices(
                        controller: homePageController,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      HomePageVipPrograms(
                        controller: tripController,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      HomePageAllPrograms(
                        controller: tripController,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                ),
              ),
            ));
          },
        ));
  }
}
