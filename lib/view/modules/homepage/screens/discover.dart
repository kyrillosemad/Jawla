import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/discover_cubit.dart';
import 'package:jawla/view/modules/homepage/widgets/discover_destination_widget.dart';
import 'package:jawla/view/modules/homepage/widgets/discover_search.dart';
import 'package:sizer/sizer.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DiscoverCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<DiscoverCubit>();
            return SafeArea(
              child: Scaffold(
                backgroundColor: AppColor.secondColor,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Search Bar
                        DiscoverSearch(
                          controller: controller,
                        ),
                        SizedBox(height: 1.h),
                        // Location Card
                        SizedBox(
                          width: 100.w,
                          height: 75.h,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return DiscoverDestinationWidget(
                                controller: controller,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
