import 'package:jawla/core/classes/post_request.dart';
import 'package:jawla/core/constants/api_links.dart';

loginReq(username, password) {
  var response = PostRequest().postRequest(
    AppLink.loginApi,
    {
      "username": username.toString(),
      "password": password.toString(),
    },
    {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );
  return response;
}
