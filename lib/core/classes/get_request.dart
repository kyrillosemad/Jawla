import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:jawla/core/classes/status.dart';
import 'package:jawla/core/functions/check_internet.dart';

class GetRequest {
  Future<Either<Status, Map>> getRequest(
      String link, Map<String, String>? headers) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(
          Uri.parse(link),
          headers: headers,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var data = jsonDecode(response.body);
          if (data is List) {
            return right({"data": data});
          }
          return right(data);
        } else {
          var errors = jsonDecode(response.body);
          return left(Status.apiFailure(errors));
        }
      } else {
        return left(Status.internetFailure);
      }
    } catch (e) {
      print(e);
      return left(Status.serverFailure);
    }
  }
}
