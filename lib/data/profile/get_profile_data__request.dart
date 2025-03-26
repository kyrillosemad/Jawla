import 'package:jawla/core/classes/get_request.dart';
import 'package:jawla/core/constants/api_links.dart';

getProfileDataReq(String token) {
  var response = GetRequest().getRequest(
    AppLink.getProfileDataApi,
    {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    },
  );
  return response;
}
