import 'dart:math';

import 'package:jawla/core/classes/post_request.dart';
import 'package:jawla/core/constants/api_links.dart';
import 'package:jawla/core/constants/variable.dart';

paymentRequest(amount, tripId) {
  var response = PostRequest().postRequest(
    AppLink.addPaymentApi,
    {
      "id": 0,
      "type": "Trip",
      "amount": amount,
      "processNumber": "${Random().nextInt(900000) + 100000}",
      "user_Id": Variable().id,
      "trip_Id": tripId.toString()
    },
    {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );
  return response;
}
