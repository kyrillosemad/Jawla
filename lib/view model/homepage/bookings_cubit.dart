import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/classes/status.dart';
import 'package:jawla/data/user_reservations/user_reservations_request.dart';
import 'package:jawla/view%20model/app_state.dart';

class BookingsCubit extends Cubit<AppState> {
  BookingsCubit() : super(Initial());
  var data = [];
  getUserReservations() async {
    emit(Loading());
    Either<Status, Map> response = await userReservationRequest();
    response.fold((l) {
      if (l.type == StatusType.internetFailure) {
        emit(InternetError());
      } else if (l.type == StatusType.serverFailure) {
        emit(ServerError());
      } else if (l.type == StatusType.apiFailure) {
        emit(ApiFailure(l.errorData['errors']));
      }
    }, (r) {
      data.addAll(r['data']);
      emit(Success([r['data']]));
    });
  }
}
