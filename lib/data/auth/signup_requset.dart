import 'package:jawla/core/classes/post_request.dart';
import 'package:jawla/core/constants/api_links.dart';

signupReq(username, email, phone, password) {
  var response = PostRequest().postRequest(
    AppLink.signupApi,
    {
      "username": username.toString(),
      'email': email.toString(),
      'phone': phone.toString(),
      "password": password.toString(),
    },
    {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );
  return response;
}
