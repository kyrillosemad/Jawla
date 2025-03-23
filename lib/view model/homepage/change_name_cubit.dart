import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/view%20model/app_state.dart';

class ChangeNameCubit extends Cubit<AppState> {
  ChangeNameCubit() : super(Initial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController newNameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
}
