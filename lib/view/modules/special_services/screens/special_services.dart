import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/special_services/special_services_cubit.dart';
import 'package:jawla/view/modules/special_services/screens/car_page.dart';
import 'package:jawla/view/modules/special_services/screens/custom_program_page.dart';
import 'package:jawla/view/modules/special_services/screens/tour_guide_page.dart';
import 'package:jawla/view/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

class SpecialServices extends StatelessWidget {
  const SpecialServices({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpecialServicesCubit(),
      child: Builder(
        builder: (context) {
          var controller = context.read<SpecialServicesCubit>();
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColor.secondColor,
              body: Column(
                children: [
                  const CustomAppbar(),
                  SizedBox(height: 3.h),
                  const Text(
                    "Book Your Own Service",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  SizedBox(
                    width: 90.w,
                    child: const Divider(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Expanded(
                    child: DefaultTabController(
                      initialIndex: controller.serviceIndex,
                      length: 3,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                tabBarTheme: TabBarTheme(
                                  indicator: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      AppColor.bottomNavColor,
                                      AppColor.bottomNavColor2
                                    ]),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: const TabBar(
                                labelColor: AppColor.secondColor,
                                unselectedLabelColor: AppColor.primaryColor,
                                tabs: [
                                  Tab(
                                    icon: Icon(Icons.local_taxi_rounded,
                                        size: 33),
                                    child: Text(
                                      "Car",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Tab(
                                    icon: Icon(Icons.person, size: 33),
                                    child: Text(
                                      "Tour Guide",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Tab(
                                    icon:
                                        Icon(Icons.workspace_premium, size: 33),
                                    child: Text(
                                      "Package",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  CarPage(controller: controller),
                                  TourGuidePage(
                                    controller: controller,
                                  ),
                                  CustomProgramPage(
                                    controller: controller,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
