import 'package:jawla/core/classes/get_request.dart';
import 'package:jawla/core/constants/api_links.dart';

getAllTripsReq() {
  var response = GetRequest().getRequest(
    AppLink.getAllTripsApi,
    {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );
  return response;
}
