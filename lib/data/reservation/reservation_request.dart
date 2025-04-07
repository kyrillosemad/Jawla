import 'package:jawla/core/classes/post_request.dart';
import 'package:jawla/core/constants/api_links.dart';

import '../../core/constants/variable.dart';

reservationReq(paymentId, tripId) {
  var response = PostRequest().postRequest(
    AppLink.addReservationApi,
    {
      "user_Id": Variable().id,
      "trip_Id": tripId,
      "paymentId": paymentId,
      "dateCreated": DateTime.now().toIso8601String(),
    },
    {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );
  return response;
}
