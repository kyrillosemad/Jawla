import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/classes/status.dart';
import 'package:jawla/data/special%20services/package_service_request.dart';
import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view/widgets/success_widget.dart';

class PackageServiceCubit extends Cubit<AppState> {
  PackageServiceCubit() : super(Initial());
  DateTime programStartDate = DateTime.now();
  DateTime programEndDate = DateTime.now();
  TextEditingController programStartPlace = TextEditingController();
  TextEditingController programEndPlace = TextEditingController();
  TextEditingController programDestinations = TextEditingController();
  TextEditingController programNumberOfPersons = TextEditingController();
  TextEditingController programCarType = TextEditingController();
  TextEditingController programGuideLanguage = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool haveCar = false;
  bool haveGuide = false;
  changeHavingCar() {
    haveCar = !haveCar;
    emit(Initial());
  }

  changeHavingGuide() {
    haveGuide = !haveGuide;
    emit(Initial());
  }

  void updateProgramStartDate(DateTime newDate) {
    programStartDate = newDate;
    emit(Initial());
  }

  void updateProgramEndDate(DateTime newDate) {
    programEndDate = newDate;
    emit(Initial());
  }

  void confirmProgramBooking() async {
    emit(Loading());
    Either<Status, Map> response = await packageServiceReq(
        programStartPlace.text,
        programEndPlace.text,
        programCarType.text,
        programNumberOfPersons.text,
        programStartDate,
        programEndDate,
        haveCar,
        haveGuide,
        programGuideLanguage.text,
        programDestinations.text);
    response.fold((l) {
      if (l.type == StatusType.internetFailure) {
        emit(InternetError());
      } else if (l.type == StatusType.serverFailure) {
        emit(ServerError());
      } else if (l.type == StatusType.apiFailure) {
        print(l.errorData['errors']);
        emit(ApiFailure(l.errorData['errors']));
      }
    }, (r) {
      emit(Success([]));
      successWidget("Success", "Program package booking request has been sent");
    });
  }
}
