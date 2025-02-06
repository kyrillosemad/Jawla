// import 'dart:convert';
// import 'package:http/http.dart' as http;

// void payWithFawaterak() async {
//   const apiUrl = 'https://staging.fawaterk.com/api/v2/invoiceInitPay';
//   const apiToken = 'd83a5d07aaeb8442dcbe259e6dae80a3f2e21a3a581e1a5acd';
//   const paymentId = 2; // 2=Visa-MasterCard, 3=Fawry, 4=Meeza

//   final requestData = {
//     'payment_method_id': paymentId,
//     'cartTotal': '100',
//     'currency': 'EGP',
//     'customer': {
//       'first_name': 'test',
//       'last_name': 'test',
//       'email': 'test@test.test',
//       'phone': '01000000000',
//       'address': 'test address',
//     },
//     'redirectionUrls': {
//       'successUrl': 'https://dev.fawaterk.com/success',
//       'failUrl': 'https://dev.fawaterk.com/fail',
//       'pendingUrl': 'https://dev.fawaterk.com/pending',
//     },
//     'cartItems': [
//       {
//         'name': 'test',
//         'price': '100',
//         'quantity': '1',
//       },
//     ],
//   };

//   final headers = {
//     'Authorization': 'Bearer $apiToken',
//     'Content-Type': 'application/json',
//   };

//   try {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: headers,
//       body: json.encode(requestData),
//     );

//     if (response.statusCode == 200) {
//       // Assuming the API returns JSON with a "status" key indicating success or failure
//       final responseData = json.decode(response.body);

//       if (responseData['status'] == 'success') {
//         // Handle success
//         print('Payment successful!');
//         print('Invoice ID: ${responseData['data']['invoice_id']}');
//         print(
//             'Meeza QR Code: ${responseData['data']['payment_data']['meezaQrCode']}');
//       } else {
//         // Handle failure
//         print('Payment failed: ${responseData['message'] ?? 'Unknown error'}');
//       }
//     } else {
//       // Handle non-200 response status
//       print('Failed to initiate payment. Status code: ${response.statusCode}');
//       print('Error: ${response.body}');
//     }
//   } catch (error) {
//     // Handle errors that occur during the request (e.g., network error)
//     print('Error occurred: $error');
//   }
// }
