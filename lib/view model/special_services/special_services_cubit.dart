import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:jawla/view%20model/app_state.dart';

class SpecialServicesCubit extends Cubit<AppState> {
  SpecialServicesCubit() : super(Initial());

  int serviceIndex = Get.arguments['serviceIndex'];
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

  void confirmCarBooking() {
    if (carReceivePlace.text.isEmpty ||
        carReturnPlace.text.isEmpty ||
        carTypeOfCar.text.isEmpty ||
        carNumberOfPersons.text.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields!",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    Get.snackbar("Success", "Car booking confirmed!",
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  /////////////////////////////////////////////
  /////////////////////////////////////////////
  DateTime guideStartDate = DateTime.now();
  DateTime guideEndDate = DateTime.now();
  TextEditingController guideStartPlace = TextEditingController();
  TextEditingController guideEndPlace = TextEditingController();
  TextEditingController guideLanguage = TextEditingController();
  TextEditingController guideDestinations = TextEditingController();

  void updateGuideStartDate(DateTime newDate) {
    guideStartDate = newDate;
    emit(Initial());
  }

  void updateGuideEndDate(DateTime newDate) {
    guideEndDate = newDate;
    emit(Initial());
  }

  void confirmGuideBooking() {
    if (carReceivePlace.text.isEmpty ||
        carReturnPlace.text.isEmpty ||
        carTypeOfCar.text.isEmpty ||
        carNumberOfPersons.text.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields!",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    Get.snackbar("Success", "Car booking confirmed!",
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  /////////////////////////////////////////////
  /////////////////////////////////////////////
  DateTime programStartDate = DateTime.now();
  DateTime programEndDate = DateTime.now();
  TextEditingController programStartPlace = TextEditingController();
  TextEditingController programEndPlace = TextEditingController();
  TextEditingController programDestinations = TextEditingController();
  TextEditingController programNumberOfPersons = TextEditingController();
  TextEditingController programCarType = TextEditingController();
  TextEditingController programGuideLanguage = TextEditingController();

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
    guideStartDate = newDate;
    emit(Initial());
  }

  void updateProgramEndDate(DateTime newDate) {
    guideEndDate = newDate;
    emit(Initial());
  }

  void confirmProgramBooking() {
    if (carReceivePlace.text.isEmpty ||
        carReturnPlace.text.isEmpty ||
        carTypeOfCar.text.isEmpty ||
        carNumberOfPersons.text.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields!",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    Get.snackbar("Success", "Car booking confirmed!",
        backgroundColor: Colors.green, colorText: Colors.white);
  }
}
