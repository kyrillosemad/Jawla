import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/view%20model/app_state.dart';

class ChangePhoneCubit extends Cubit<AppState> {
  ChangePhoneCubit() : super(Initial());

  GlobalKey<FormState> formFey = GlobalKey<FormState>();
    TextEditingController passwordCont = TextEditingController();
  TextEditingController phoneCubit = TextEditingController();
}
