import 'package:flutter/material.dart';
import 'package:jawla/model/trip/trip_details_model.dart';

import 'package:sizer/sizer.dart';

class AboutThesePlaces extends StatelessWidget {
  final TripDetailsModel tripDetailsModel;
  const AboutThesePlaces({super.key, required this.tripDetailsModel});

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
          height: 0.7.h,
        ),
        Text(
          "${tripDetailsModel.description}",
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    );
  }
}
