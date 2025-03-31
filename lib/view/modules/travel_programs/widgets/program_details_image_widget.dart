// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/constants/colors.dart';
import 'package:jawla/core/constants/images.dart';
import 'package:jawla/model/trip/trip_details_model.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view%20model/homepage/favorite_cubit.dart';
import 'package:jawla/view%20model/travel_programs/program_details_cubit.dart';
import 'package:jawla/view/modules/travel_programs/widgets/program_details_program_widget.dart';
import 'package:sizer/sizer.dart';

class ProgramDetailsImageWidget extends StatelessWidget {
  final ProgramDetailsCubit controller;
  final TripDetailsModel tripDetailsModel;
  final FavoriteCubit favoriteController;
  const ProgramDetailsImageWidget(
      {super.key,
      required this.tripDetailsModel,
      required this.controller,
      required this.favoriteController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 95.w,
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: tripDetailsModel.mainImage == null ||
                        tripDetailsModel.mainImage!.isEmpty
                    ? AssetImage(AppImages().bj1) as ImageProvider
                    : NetworkImage(controller.mainImage) as ImageProvider,
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            Positioned(
                top: 15,
                right: 15,
                child: BlocBuilder<FavoriteCubit, AppState>(
                    builder: (context, state) {
                  bool isFavorite = context
                      .watch<FavoriteCubit>()
                      .isTripFavorite(tripDetailsModel.id.toString());
                  return CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 203, 208, 220),
                    child: IconButton(
                        onPressed: () {
                          favoriteController
                              .toggleFavorite(tripDetailsModel.id.toString());
                        },
                        icon: isFavorite
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: AppColor.secondColor,
                              )),
                  );
                })),
            Positioned(
              bottom: 2.h,
              right: 7.5.w,
              child: ProgramDetailsProgramWidget(
                  tripDetailsModel: tripDetailsModel),
            )
          ],
        ),
      ),
    );
  }
}
