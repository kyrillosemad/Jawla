import 'package:flutter/material.dart';
import 'package:jawla/view%20model/auth/signin_cubit.dart';

class ForgetPasswordButton extends StatelessWidget {
  final SignInCubit controller;
  const ForgetPasswordButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            controller.goToForgetPassword();
          },
          child: const Text(
            "Forget Password ?",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
