import 'package:jawla/core/classes/post_request.dart';
import 'package:jawla/core/constants/api_links.dart';
import 'package:jawla/core/constants/variable.dart';

packageServiceReq(
    var startPlace,
    var endPlace,
    var carType,
    var numberOfPersons,
    var startDate,
    var endDate,
    var addCar,
    var addGuide,
    var language,
    var description) {
  var response = PostRequest().postRequest(AppLink.addPackageServiceApi, {
    "numberOfPersons": numberOfPersons,
    "addCar": addCar,
    "addGuide": addGuide,
    "language": language,
    "description": description,
    "start_place": startPlace,
    "end_place": endPlace,
    "carType": carType,
    "startDate": "2025-04-02T00:44:40.947Z",
    "endDate": "2025-04-02T00:44:40.947Z"
  }, {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${Variable().token}",
  });
  return response;
}
