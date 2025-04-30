import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/homepage_cubit.dart';
import 'package:jawla/view/modules/homepage/widgets/home_page_all_programs.dart';
import 'package:jawla/view/modules/homepage/widgets/home_page_appbar.dart';
import 'package:jawla/view/modules/homepage/widgets/home_page_custom_services.dart';
import 'package:jawla/view/modules/homepage/widgets/home_page_vip_programs.dart';
import 'package:jawla/view/modules/homepage/widgets/homepage_image.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/variable.dart';
import '../../../../view model/homepage/favorite_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomePageCubit(),
          ),
      
        ],
        child: Builder(
          builder: (context) {
            var homePageController = context.read<HomePageCubit>();
            var favoriteController = context.read<FavoriteCubit>();
            homePageController.getProfileInfo(Variable().token);
            homePageController.getAllTrips("");
            favoriteController.getFavoriteFun();
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
                      HomePageAllPrograms(
                          homePageCubit: homePageController,
                          favoriteController: favoriteController),
                      HomePageVipPrograms(
                          homePageCubit: homePageController,
                          favoriteController: favoriteController),
                      SizedBox(
                        height: 1.h,
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
