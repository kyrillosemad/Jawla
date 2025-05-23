import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/homepage/bookings_cubit.dart';
import 'package:jawla/view/modules/homepage/widgets/bookings_program_widget.dart';
import 'package:jawla/view/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BookingsCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<BookingsCubit>();
            controller.getUserReservations();
            return Scaffold(
              appBar: const CustomAppbar(),
              backgroundColor: AppColor.secondColor,
              body: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Column(
                  children: [
                    Text(
                      "Bookings",
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Expanded(
                        child: BookingsProgramWidget(controller: controller)),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
