import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/core/classes/status.dart';
import 'package:jawla/data/home/special%20services/guide_service_request.dart';

import 'package:jawla/view%20model/app_state.dart';
import 'package:jawla/view/widgets/success_widget.dart';

class GuideServiceCubit extends Cubit<AppState> {
  GuideServiceCubit() : super(Initial());
  DateTime guideStartDate = DateTime.now();
  DateTime guideEndDate = DateTime.now();
  TextEditingController guideStartPlace = TextEditingController();
  TextEditingController guideEndPlace = TextEditingController();
  TextEditingController guideLanguage = TextEditingController();
  TextEditingController guideDestinations = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void updateGuideStartDate(DateTime newDate) {
    guideStartDate = newDate;
    emit(Initial());
  }

  void updateGuideEndDate(DateTime newDate) {
    guideEndDate = newDate;
    emit(Initial());
  }

  void confirmGuideBooking() async {
    emit(Loading());
    Either<Status, Map> response = await guideServiceReq(
        guideStartPlace.text,
        guideEndPlace.text,
        guideLanguage.text,
        guideDestinations.text,
        guideStartDate.toIso8601String(),
        guideEndDate.toIso8601String());
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
      successWidget("Success", "Guide booking request has been sent");
    });
  }
}
