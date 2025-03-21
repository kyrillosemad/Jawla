import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/account_cubit.dart';
import 'package:jawla/view/modules/homepage/widgets/custom_row.dart';
import 'package:jawla/view/modules/homepage/widgets/divider_widget.dart';
import 'package:sizer/sizer.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AccountCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<AccountCubit>();
            return SafeArea(
                child: Scaffold(
              backgroundColor: AppColor.secondColor,
              body: SizedBox(
                width: 100.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      width: 95.w,
                      height: 22.h,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            AppColor.bottomNavColor,
                            AppColor.bottomNavColor2
                          ]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        CircleAvatar(
                          backgroundColor:
                              AppColor.bottomNavColor.withOpacity(1),
                          radius: 25.sp,
                          child: Icon(
                            Icons.person,
                            size: 30.sp,
                            color: AppColor.secondColor,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "kyrillos",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: AppColor.secondColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "kyrillos@gmail.com",
                          style: TextStyle(
                              fontSize: 12.sp, color: AppColor.secondColor),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Container(
                      width: 95.w,
                      height: 45.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(colors: [
                            AppColor.bottomNavColor,
                            AppColor.bottomNavColor2
                          ])),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Icon(
                                Icons.badge,
                                size: 27.sp,
                                color: AppColor.secondColor,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "ID : 484178",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          const DividerWidget(),
                          SizedBox(
                            height: 1.h,
                          ),
                          CustomRow(
                              icon2: Icons.arrow_forward_ios,
                              function: () {
                                controller.goToSettings();
                              },
                              icon: Icons.settings,
                              name: "Settings"),
                          SizedBox(
                            height: 1.h,
                          ),
                          const DividerWidget(),
                          SizedBox(
                            height: 1.h,
                          ),
                          CustomRow(
                              function: () {
                                controller.goToFavorite();
                              },
                              icon: Icons.favorite,
                              icon2: Icons.arrow_forward_ios,
                              name: "Favorite"),
                          SizedBox(
                            height: 1.h,
                          ),
                          const DividerWidget(),
                          SizedBox(
                            height: 1.h,
                          ),
                          CustomRow(
                              icon2: Icons.arrow_forward_ios,
                              function: () {
                                controller.goToBookings();
                              },
                              icon: Icons.save,
                              name: "Bookings"),
                          SizedBox(
                            height: 1.h,
                          ),
                          const DividerWidget(),
                          SizedBox(
                            height: 1.h,
                          ),
                          CustomRow(
                            icon2: Icons.arrow_forward_ios,
                            function: () {
                              Get.defaultDialog(
                                title: "Logout Confirmation",
                                middleText: "Are you sure you want to log out?",
                                titleStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                middleTextStyle: const TextStyle(
                                  fontSize: 16,
                                  color: AppColor.secondColor,
                                ),
                                barrierDismissible: false,
                                backgroundColor: Colors.transparent,
                                radius: 12,
                                content: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 203, 209, 163),
                                        Color.fromARGB(255, 93, 123, 179)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        "Are you sure you want to log out?",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white24,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: const Text("Cancel",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              controller.logOut();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.redAccent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: const Text("Logout",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: Icons.logout,
                            name: "Logout",
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          const DividerWidget(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
          },
        ));
  }
}
