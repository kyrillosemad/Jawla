import 'package:get/get.dart';
import 'package:jawla/core/services/services.dart';

class Variable {
  final services = Get.put(Services());

  late String id;
  late String email;
  late String username;
  late String phone;
  late String token;
  Variable() {
    init();
  }

  void init() {
    id = services.sharedPref!.getString("id") ?? "";
    email = services.sharedPref!.getString("email") ?? "";
    username = services.sharedPref!.getString("username") ?? "";
    phone = services.sharedPref!.getString("phone") ?? "";
    token = services.sharedPref!.getString("userToken") ?? "";
  }
}
