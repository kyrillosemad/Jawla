import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/view%20model/travel_programs/complete_payment_cubit.dart';
import 'package:sizer/sizer.dart';

class CompletePayment extends StatelessWidget {
  const CompletePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CompletePaymentCubit(),
        child: Builder(
          builder: (context) {
            //      var controller = context.read<CompletePaymentCubit>();
            return Scaffold(
              backgroundColor: AppColor.secondColor,
              body: SizedBox(
                width: 100.w,
                height: 100.h,
              ),
            );
          },
        ));
  }
}
