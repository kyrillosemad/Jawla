import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawla/view%20model/app_state.dart';

class ForgetPasswordCubit extends Cubit<AppState> {
  ForgetPasswordCubit() : super(Initial());
  GlobalKey<FormState> pageKey = GlobalKey<FormState>();
  PageController pageController = PageController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();

  bool securePass1 = false;
  bool securePass2 = false;

  changeSecurePass1() {
    securePass1 = !securePass1;
    emit(Initial());
  }

  changeSecurePass2() {
    securePass2 = !securePass2;
    emit(Initial());
  }

  goToCheckEmail() {
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 700), curve: Curves.easeIn);
  }

  goToNewPassword() {
    pageController.animateToPage(2,
        duration: const Duration(milliseconds: 700), curve: Curves.easeIn);
  }
}
