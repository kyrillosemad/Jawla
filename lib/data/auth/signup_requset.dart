import 'package:jawla/core/classes/request.dart';
import 'package:jawla/core/constants/api_links.dart';

signupReq(username, email, phone, password) {
  var response = Request().request(AppLink.signupApi, {
    "username": username.toString(),
    'email': email.toString(),
    'phone': phone.toString(),
    "password": password.toString(),
  });
  return response;
}
