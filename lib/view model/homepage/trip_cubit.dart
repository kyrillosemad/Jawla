import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:jawla/core/classes/status.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/data/home/trip/get_all_trips.dart';
import 'package:jawla/view%20model/app_state.dart';

class TripCubit extends Cubit<AppState> {
  TripCubit() : super(Initial());
  List data = [];

  getAllTrips() async {
    emit(Loading());
    Either<Status, Map> response = await getAllTripsReq();
    response.fold((l) {
      if (l.type == StatusType.internetFailure) {
        emit(InternetError());
      } else if (l.type == StatusType.serverFailure) {
        emit(ServerError());
      } else if (l.type == StatusType.apiFailure) {
        emit(ApiFailure(l.errorData['errors']));
      }
    }, (r) {
      data = [];
      data.addAll(r['data']);
      emit(Success(data));
    });
  }

  goToProgramDetails(int? id) {
    Get.toNamed(AppRoutes().programDetails, arguments: {
      "id": id,
    });
  }
}
