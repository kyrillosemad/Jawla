import 'package:jawla/core/classes/get_request.dart';
import 'package:jawla/core/constants/api_links.dart';
import 'package:jawla/core/constants/variable.dart';

userReservationRequest() {
  var response = GetRequest().getRequest(AppLink.userTripsApi, {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${Variable().token}",
  });
  return response;
}
