import 'package:jawla/core/classes/post_request.dart';
import 'package:jawla/core/constants/api_links.dart';
import 'package:jawla/core/constants/variable.dart';

carServiceReq(var receivePlace, var returnPlace, var carType,
    var numberOfPersons, var startDate, var endDate) {
  var response = PostRequest().postRequest(AppLink.addCarServiceApi, {
    "receivePlace": receivePlace,
    "returnPlace": returnPlace,
    "carType": carType,
    "numberOfPersons": numberOfPersons,
    "startDate": startDate,
    "endDate": endDate
  }, {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${Variable().token}",
  });
  return response;
}
