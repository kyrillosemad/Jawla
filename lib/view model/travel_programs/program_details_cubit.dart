import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:jawla/core/constants/routes_name.dart';
import 'package:jawla/view%20model/app_state.dart';

class ProgramDetailsCubit extends Cubit<AppState> {
  ProgramDetailsCubit() : super(Initial());
  goToPaymentMethods() {
    Get.toNamed(AppRoutes().paymentMethod);
  }
}
