import 'package:jawla/core/classes/put_request.dart';
import 'package:jawla/core/constants/api_links.dart';

changePasswordReq(String token, String oldPassword, String newPassword) {
  var response = PutRequest().putRequest(AppLink.changePasswordApi, {
    "oldPassword": oldPassword,
    "newPassword": newPassword,
  }, {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $token",
  });
  return response;
}
