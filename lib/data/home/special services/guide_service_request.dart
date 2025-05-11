import 'package:jawla/core/classes/post_request.dart';
import 'package:jawla/core/constants/api_links.dart';
import 'package:jawla/core/constants/variable.dart';

guideServiceReq(var startPlace, var endPlace, var language, var destination,
    var startDate, var endDate) {
  var response = PostRequest().postRequest(AppLink.addGuideServiceApi, {
    "startPlace": startPlace,
    "endPlace": endPlace,
    "language": language,
    "destinations": destination,
    "startDate": startDate,
    "endDate": endDate
  }, {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${Variable().token}",
  });
  return response;
}
