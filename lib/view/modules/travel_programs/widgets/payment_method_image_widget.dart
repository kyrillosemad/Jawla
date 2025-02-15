import 'package:flutter/material.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/view/modules/travel_programs/widgets/program_details_program_widget.dart';
import 'package:sizer/sizer.dart';

class PaymentMethodImageWidget extends StatelessWidget {
  const PaymentMethodImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 95.w,
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: AssetImage(AppImages().bj1), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
              bottom: 2.h,
              right: 7.5.w,
              child: const ProgramDetailsProgramWidget(),
            )
          ],
        ),
      ),
    );
  }
}
