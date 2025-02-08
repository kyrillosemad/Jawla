import 'package:flutter/material.dart';
import 'package:jawla/core/constants/text_styles.dart';

class AuthPageTitle extends StatelessWidget {
  final String name;
  const AuthPageTitle({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        name,
        style: AppTextStyles().mainTitles,
      ),
    );
  }
}
