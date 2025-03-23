import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/view%20model/app_state.dart';

class ChangeEmailCubit extends Cubit<AppState> {
  ChangeEmailCubit() : super(Initial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
}
