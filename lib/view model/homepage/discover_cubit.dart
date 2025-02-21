import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/view%20model/app_state.dart';

class DiscoverCubit extends Cubit<AppState> {
  DiscoverCubit() : super(Initial());

  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController search = TextEditingController();
}
