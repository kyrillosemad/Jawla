import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/view%20model/app_state.dart';

class ChangePasswordCubit extends Cubit<AppState> {
  ChangePasswordCubit() : super(Initial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController oldPasswordCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
    TextEditingController confirmPasswordCont = TextEditingController();
}
