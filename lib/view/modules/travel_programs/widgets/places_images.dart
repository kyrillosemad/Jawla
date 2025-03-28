import 'package:flutter/material.dart';
import 'package:jawla/model/trip/trip_details_model.dart';
import 'package:jawla/view%20model/travel_programs/program_details_cubit.dart';
import 'package:sizer/sizer.dart';

class PlacesImages extends StatelessWidget {
  final TripDetailsModel tripDetailsModel;
  final ProgramDetailsCubit controller;
  const PlacesImages(
      {super.key, required this.tripDetailsModel, required this.controller});

  @override
  Widget build(BuildContext context) {
    List<String>? images = tripDetailsModel.images;
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
            itemCount: images!.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  controller.setMainImage(tripDetailsModel.images![index]);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: 14.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          image: NetworkImage(images[index]),
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
