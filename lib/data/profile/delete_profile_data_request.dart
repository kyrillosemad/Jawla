import 'package:jawla/core/classes/delete_request.dart';
import 'package:jawla/core/constants/api_links.dart';

deleteProfileDataReq(String password, String token) {
  var response = DeleteRequest().deleteRequest(AppLink.deleteProfileDataApi, {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $token",
  }, {
    "password": password.toString(),
  });
  return response;
}
