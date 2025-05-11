import 'package:jawla/core/classes/put_request.dart';
import 'package:jawla/core/constants/api_links.dart';
import 'package:jawla/core/constants/variable.dart';

updatePriceRequest(var type, var id, var price) {
  var response = PutRequest().putRequest("${AppLink.updatePrice}$type/$id", {
    "state": "Pending",
    "price": price
  }, {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${Variable().token}",
  });
  return response;
}
