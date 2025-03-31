import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/classes/status.dart';
import 'package:jawla/data/favorite/add_favorite_req.dart';
import 'package:jawla/data/favorite/get_favorite_req.dart';
import 'package:jawla/data/favorite/remove_favorite_req.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view/widgets/success_widget.dart';
import 'package:jawla/view/widgets/warning_widget.dart';
import '../../core/constants/routes_name.dart';

class FavoriteCubit extends Cubit<AppState> {
  FavoriteCubit() : super(Initial());

  List<String> favoriteTripIds = [];
  var data = [];

  Future<void> getFavoriteFun() async {
    emit(Loading());
    Either<Status, Map> response = await getFavoriteReq();
    response.fold((l) {
      if (l.type == StatusType.internetFailure) {
        emit(InternetError());
      } else if (l.type == StatusType.serverFailure) {
        emit(ServerError());
      } else if (l.type == StatusType.apiFailure) {
        emit(ApiFailure(l.errorData['errors']));
      }
    }, (r) {
      data = r['favorites'];
      favoriteTripIds =
          data.map<String>((trip) => trip['id'].toString()).toList();
      emit(Success(data));
    });
  }

  goToProgramDetails(int? id) {
    Get.toNamed(AppRoutes().programDetails, arguments: {
      "id": id,
    });
  }

  bool isTripFavorite(String tripId) {
    return favoriteTripIds.contains(tripId);
  }

  void toggleFavorite(String tripId) async {
    if (isTripFavorite(tripId)) {
      await removeFavoriteFun(tripId);
    } else {
      await addFavoriteFun(tripId);
    }
    emit(Initial());
  }

  Future<void> addFavoriteFun(String tripId) async {
    Either<Status, Map> response = await addFavoriteReq(tripId);
    response.fold((l) {
      if (l.type == StatusType.apiFailure) {
        warningWidget(
            "Failed", Icons.warning_amber, '${l.errorData['errors']}');
      }
    }, (r) {
      getFavoriteFun();
      favoriteTripIds.add(tripId);
      emit(Initial());
      successWidget("Success", r['sucess']);
    });
  }

  Future<void> removeFavoriteFun(String tripId) async {
    Either<Status, Map> response = await removeFavoriteReq(tripId);
    response.fold((l) {
      if (l.type == StatusType.apiFailure) {
        warningWidget(
            "Failed", Icons.warning_amber, '${l.errorData['errors']}');
      }
    }, (r) {
      getFavoriteFun();
      successWidget("Success", r['sucess']);
      favoriteTripIds.remove(tripId);
      emit(Initial());
    });
  }
}
