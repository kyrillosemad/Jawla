import 'package:flutter_paymob/flutter_paymob.dart';

paymobManager() {
  FlutterPaymob.instance.initialize(
      apiKey:
          "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1Rrek56TXdMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuVTFKdFVkTDc4dHJiOU9QYnV3WHU5RGRTcXRfRkR1ZFh2cWxjNW9VZWdWc1N6TENYWFdCamotOHEza1g3S3duRXFMemt5MlE4bU9QVWJPZE80SWlKcUE=", //  // from dashboard Select Settings -> Account Info -> API Key
      integrationID:
          4827033, // // from dashboard Select Developers -> Payment Integrations -> Online Card ID
      walletIntegrationId:
          4889567, // // from dashboard Select Developers -> Payment Integrations -> Online wallet
      iFrameID: 866157); // from paymob Select Developers -> iframes
}
