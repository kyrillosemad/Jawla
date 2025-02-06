import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes.dart';
import 'package:jawla/core/constants/theme.dart';
import 'package:jawla/core/localization/translation.dart';
import 'package:jawla/core/services/services.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding1.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final services = Get.put(Services());
  runApp(const Jawla());
}

class Jawla extends StatelessWidget {
  const Jawla({super.key});

  @override
  Widget build(BuildContext context) {
    final services = Get.find<Services>();
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          routes: routes,
          debugShowCheckedModeBanner: false,
          theme: theme,
          translations: MyTranslation(),
          home: const OnBoarding1(),
        );
      },
    );
  }
}
