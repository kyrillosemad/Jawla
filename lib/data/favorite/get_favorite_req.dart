import 'package:jawla/core/classes/get_request.dart';
import 'package:jawla/core/constants/api_links.dart';
import 'package:jawla/core/constants/variable.dart';

getFavoriteReq() {
  var response = GetRequest().getRequest(
    AppLink.getFavoriteApi,
    {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${Variable().token}",
    },
  );
  return response;
}
