import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:jawla/core/classes/status.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/data/home/trip/get_trip_details.dart';
import 'package:jawla/view%20model/app_state.dart';

class ProgramDetailsCubit extends Cubit<AppState> {
  ProgramDetailsCubit() : super(Initial());
  goToPaymentMethods() {
    Get.toNamed(AppRoutes().paymentMethod);
  }

  int numOfPersons = 0;
  increment() {
    numOfPersons++;
    emit(Initial());
  }

  decrement() {
    if (numOfPersons > 0) {
      numOfPersons--;
      emit(Initial());
    } else {}
  }

  late String mainImage;

  setMainImage(String image) {
    mainImage = image;
    emit(Initial());
  }

  int id = Get.arguments['id'];
  List data = [];
  getTripDetails(id) async {
    emit(Loading());
    Either<Status, Map> response = await getTripDetailsReq(id);
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
      data.add(r);
      mainImage = r['main_image'];
      emit(Success(data));
    });
  }
}
