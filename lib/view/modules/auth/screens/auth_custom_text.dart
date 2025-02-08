import 'package:flutter/material.dart';
import 'package:jawla/core/constants/colors.dart';

class AuthCustomText extends StatelessWidget {
  final void Function()? function;
  final String text1;
  final String text2;
  const AuthCustomText(
      {super.key,
      required this.function,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          InkWell(
            onTap: function,
            child: Text(
              text2,
              style:
                  const TextStyle(fontSize: 16, color: AppColor.primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
