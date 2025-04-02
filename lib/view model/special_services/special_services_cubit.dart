import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:jawla/view%20model/app_state.dart';

class SpecialServicesCubit extends Cubit<AppState> {
  SpecialServicesCubit() : super(Initial());

  int serviceIndex = Get.arguments['serviceIndex'];

}
