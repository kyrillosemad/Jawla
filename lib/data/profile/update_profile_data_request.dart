import 'package:jawla/core/classes/put_request.dart';
import 'package:jawla/core/constants/api_links.dart';

updateProfileDataReq(
    String token, String username, String email, String phone) {
  var response = PutRequest().putRequest(
    AppLink.updateProfileDataApi,
    {
      "username": username.toString(),
      "email": email.toString(),
      "phone": phone.toString(),
    },
    {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    },
  );
  return response;
}
