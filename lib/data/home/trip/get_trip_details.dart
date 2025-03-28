import 'package:jawla/core/classes/get_request.dart';
import 'package:jawla/core/constants/api_links.dart';

getTripDetailsReq(int id) {
  var response = GetRequest().getRequest(
    "${AppLink.getTripDetailsApi}$id",
    {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );
  return response;
}
