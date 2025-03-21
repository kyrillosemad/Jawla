import 'package:jawla/core/classes/request.dart';
import 'package:jawla/core/constants/api_links.dart';

loginReq(username, password) {
  var response = Request().request(AppLink.loginApi, {
    "username": username.toString(),
    "password": password.toString(),
  });
  return response;
}
