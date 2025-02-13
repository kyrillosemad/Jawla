import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/view%20model/homepage/homepage_cubit.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomePageCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<HomePageCubit>();
            return SafeArea(
                child: Scaffold(
              backgroundColor: AppColor.secondColor,
              body: SizedBox(
                width: 100.w,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      width: 100.w,
                      height: 15.h,
                      decoration: const BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Hi, Kyrillos",
                                style: TextStyle(
                                    fontSize: 17, color: AppColor.secondColor),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.notifications,
                                        size: 27,
                                        color: AppColor.secondColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.menu,
                                        size: 27,
                                        color: AppColor.secondColor,
                                      ))
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Center(
                            child: Form(
                              key: controller.searchKey,
                              child: TextFormField(
                                controller: controller.searchCont,
                                cursorColor: AppColor.primaryColor,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                      size: 27,
                                    ),
                                    label: Text("Search"),
                                    labelStyle: TextStyle(color: Colors.white),
                                    contentPadding:
                                        EdgeInsets.only(left: 30, right: 30),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColor.secondColor2,
                                            width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    fillColor: AppColor.secondColor,
                                    filled: true),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: 96.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topRight: Radius.circular(100)),
                          image: DecorationImage(
                              image: AssetImage(
                                AppImages().bj3,
                              ),
                              fit: BoxFit.cover,
                              opacity: 0.4)),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      width: 100.w,
                      margin: const EdgeInsets.only(left: 10),
                      height: 18.h,
                      decoration: const BoxDecoration(
                          color: AppColor.secondColor3,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(30),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 0.7.h,
                          ),
                          const Center(
                            child: Text(
                              "Special Services",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 0.h,
                          ),
                          SizedBox(
                            width: 98.w,
                            height: 13.h,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 32.w,
                                    height: 12.h,
                                    decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        const Icon(
                                          Icons.car_repair,
                                          size: 33,
                                          color: AppColor.secondColor,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        const Text(
                                          "Car",
                                          style: TextStyle(fontSize: 17),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 100.w,
                        height: 27.h,
                        child: Stack(
                          children: [
                            Container(
                              width: 100.w,
                              height: 20.h,
                              color: AppColor.secondColor3,
                            ),
                            Container(
                              width: 100.w,
                              height: 27.h,
                              decoration: const BoxDecoration(
                                  color: AppColor.secondColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.elliptical(80, 35))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10),
                                    child: const Text(
                                      "Come To End",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    height: 20.h,
                                    child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 6,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(left: 8),
                                          width: 73.w,
                                          height: 13.h,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      AppImages().bj1),
                                                  fit: BoxFit.cover,
                                                  opacity: 0.4),
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 1.h,
                                                right: 4.w,
                                                child: const CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 203, 208, 220),
                                                  child: Icon(
                                                    Icons.favorite_border,
                                                    color: AppColor.secondColor,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 1.h,
                                                left: 7.w,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(7),
                                                  width: 60.w,
                                                  height: 12.h,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                                  255,
                                                                  218,
                                                                  223,
                                                                  235)
                                                              .withOpacity(0.8)
                                                              .withAlpha(230),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  15))),
                                                  child: Column(
                                                    children: [
                                                      const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Luxor Temple",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: AppColor
                                                                    .secondColor),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .location_on,
                                                                size: 20,
                                                              ),
                                                              Text(
                                                                "Luxor",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: AppColor
                                                                        .secondColor),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const Divider(
                                                        color: Colors.white,
                                                        thickness: 1,
                                                      ),
                                                      const Row(
                                                        children: [
                                                          Icon(
                                                            Icons.date_range,
                                                            size: 17,
                                                            color: AppColor
                                                                .secondColor,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "3 Days",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: AppColor
                                                                    .secondColor),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 0.5.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .monetization_on,
                                                                size: 20,
                                                                color: AppColor
                                                                    .secondColor,
                                                              ),
                                                              SizedBox(
                                                                width: 1.w,
                                                              ),
                                                              const Text(
                                                                "250 L.E",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: AppColor
                                                                        .secondColor),
                                                              )
                                                            ],
                                                          ),
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              width: 20.w,
                                                              height: 3.h,
                                                              decoration: BoxDecoration(
                                                                  color: AppColor
                                                                      .secondColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  "Book Now",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ));
          },
        ));
  }
}
