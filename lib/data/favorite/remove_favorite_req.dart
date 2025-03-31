import 'package:jawla/core/classes/delete_request.dart';
import 'package:jawla/core/constants/api_links.dart';
import 'package:jawla/core/constants/variable.dart';

removeFavoriteReq(String tripId) {
  var response =
      DeleteRequest().deleteRequest("${AppLink.removeFavoriteApi}$tripId", {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${Variable().token}",
  }, {});
  return response;
}
