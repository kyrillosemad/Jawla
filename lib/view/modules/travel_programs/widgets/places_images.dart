import 'package:flutter/material.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:sizer/sizer.dart';

class PlacesImages extends StatelessWidget {
  const PlacesImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Places",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        SizedBox(
          width: 100.w,
          height: 5.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: 14.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          image: AssetImage(AppImages().bj1),
                          fit: BoxFit.cover)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
