import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutThesePlaces extends StatelessWidget {
  const AboutThesePlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "About these Places",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        const Text(
          "Enjoy your trip with us in Luxor. We will see the Luxor Temple and the Temple of Hatshepsut and learn about the history of Egyptian civilization and the value of these temples to Egyptian civilization.",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
