// import 'package:dio/dio.dart';
// import 'package:re7la/core/functions/paymob_payment/paymob_managet.dart';

// class PayWithRefCodeClass {
//   Future<String> payWithRefCode(int amount) async {
//     try {
//       PaymobManager paymobManager = PaymobManager();
//       String paymentKey = await paymobManager.getPaymentKey(amount, "EGP");

//       final response = await Dio().post(
//         "https://accept.paymob.com/api/acceptance/payments/pay",
//         data: {
//           "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
//           "payment_token": paymentKey,
//         },
//       );
//       return response.data["id"].toString();
//     } catch (e) {
//       throw Exception("Failed to process payment");
//     }
//   }

//   Future<bool> checkPaymentStatus(String paymentId) async {
//     try {
//       final response = await Dio().get(
//         "https://accept.paymob.com/api/acceptance/payments/$paymentId",
//       );
//       if (response.data['success'] == true &&
//           response.data['is_auth'] == true) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       return false;
//     }
//   }
// }
