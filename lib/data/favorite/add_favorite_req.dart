import 'package:jawla/core/classes/post_request.dart';
import 'package:jawla/core/constants/api_links.dart';
import 'package:jawla/core/constants/variable.dart';

addFavoriteReq(String tripId) {
  var response =
      PostRequest().postRequest("${AppLink.addFavoriteApi}$tripId", {}, {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${Variable().token}",
  });
  return response;
}
