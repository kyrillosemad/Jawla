import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/classes/status.dart';
import 'package:jawla/data/home/special%20services/car_service_request.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view/widgets/success_widget.dart';

class CarServiceCubit extends Cubit<AppState> {
  CarServiceCubit() : super(Initial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime carStartDate = DateTime.now();
  DateTime carEndDate = DateTime.now();
  TextEditingController carReceivePlace = TextEditingController();
  TextEditingController carReturnPlace = TextEditingController();
  TextEditingController carTypeOfCar = TextEditingController();
  TextEditingController carNumberOfPersons = TextEditingController();

  get isCarBooked => null;

  void updateCarStartDate(DateTime newDate) {
    carStartDate = newDate;
    emit(Initial());
  }

  void updateCarEndDate(DateTime newDate) {
    carEndDate = newDate;
    emit(Initial());
  }

  void confirmCarBooking() async {
    emit(Loading());
    Either<Status, Map> response = await carServiceReq(
        carReceivePlace.text,
        carReturnPlace.text,
        carTypeOfCar.text,
        carNumberOfPersons.text,
        carStartDate.toIso8601String(),
        carEndDate.toIso8601String());
    response.fold((l) {
  
      if (l.type == StatusType.internetFailure) {
        emit(InternetError());
      } else if (l.type == StatusType.serverFailure) {
        emit(ServerError());
      } else if (l.type == StatusType.apiFailure) {
        emit(ApiFailure(l.errorData['errors']));
      }
    }, (r) {
      emit(Success([]));
      successWidget("Success", "car booking request has been sent");
    });
  }
}
