import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:get/get.dart';
import 'package:jawla/view%20model/travel_programs/payment_method_cubit.dart';

//with package flutter_paypal
//client id from paypal site
// secret id from paypal site
payWithPaypal(
    BuildContext context, PaymentMethodCubit controller, String amount) {
  controller.setInitialState();
  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => UsePaypal(
        sandboxMode: true,
        clientId:
            "AW1TdvpSGbIM5iP4HJNI5TyTmwpY9Gv9dYw8_8yW5lYIbCqf326vrkrp0ce9TAqjEGMHiV3OqJM_aRT0",
        secretKey:
            "EHHtTDjnmTZATYBPiGzZC_AZUfMpMAzj2VZUeqlFUrRJA_C0pQNCxDccB5qoRQSEdcOnnKQhycuOWdP9",
        returnURL: "https://samplesite.com/return",
        cancelURL: "https://samplesite.com/cancel",
        transactions: const [
          {
            "amount": {
              "total": '10.12',
              "currency": "USD",
              "details": {
                "subtotal": '10.12',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                {
                  "name": "A demo product",
                  "quantity": 1,
                  "price": '10.12',
                  "currency": "USD"
                }
              ],

              // shipping address is not required though
              "shipping_address": {
                "recipient_name": "Jane Foster",
                "line1": "Travis County",
                "line2": "",
                "city": "Austin",
                "country_code": "US",
                "postal_code": "73301",
                "phone": "+00000000",
                "state": "Texas"
              },
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          controller.completePayment();
        },
        onError: (error) {
          Get.snackbar(
            "Payment Failed",
            "Payment failed. Please try again.",
            backgroundColor: Colors.red.withOpacity(0.6),
            colorText: Colors.white,
          );
        },
        onCancel: (params) {
          Get.snackbar(
            "Payment Failed",
            "Payment failed. Please try again.",
            backgroundColor: Colors.red.withOpacity(0.6),
            colorText: Colors.white,
          );
        }),
  ));
}
