// import 'dart:convert';
// import 'package:http/http.dart' as http;

// fawaterakFetchPaymentMethods() async {
//   const apiUrl = 'https://staging.fawaterk.com/api/v2/getPaymentmethods';
//   const accessToken = 'd83a5d07aaeb8442dcbe259e6dae80a3f2e21a3a581e1a5acd';
//   try {
//     final response = await http.get(Uri.parse(apiUrl), headers: {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $accessToken',
//     });
//     final responseData = json.decode(response.body);
//     return responseData;
//   } catch (error) {
//     throw Exception(error);
//   }
// }
