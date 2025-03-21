import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:jawla/core/classes/status.dart';
import 'package:jawla/core/functions/check_internet.dart';

class Request {
  Future<Either<Status, Map>> request(String link, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(link),
          body: jsonEncode(data),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var data = jsonDecode(response.body);
          return right(data);
        } else {
          var errors = jsonDecode(response.body);
          return left(Status.apiFailure(errors));
        }
      } else {
        return left(Status.internetFailure);
      }
    } catch (e) {
      return left(Status.serverFailure);
    }
  }
}
