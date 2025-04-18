import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jawla/core/constants/routes.dart';
import 'package:jawla/core/constants/theme.dart';
import 'package:jawla/core/functions/paymob_payment/package_paymob_manager.dart';
import 'package:jawla/core/localization/translation.dart';
import 'package:jawla/core/services/services.dart';
import 'package:jawla/view%20model/homepage/favorite_cubit.dart';
import 'package:jawla/view/modules/homepage/screens/bottom_nav.dart';
import 'package:jawla/view/modules/onboarding/screens/onboarding1.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final services = Get.put(Services());
  await services.init();
  paymobManager();
  runApp(const Jawla());
}

class Jawla extends StatelessWidget {
  const Jawla({super.key});

  @override
  Widget build(BuildContext context) {
    final services = Get.find<Services>();
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FavoriteCubit(),
            ),
          ],
          child: GetMaterialApp(
            routes: routes,
            debugShowCheckedModeBanner: false,
            theme: theme,
            translations: MyTranslation(),
            home: services.sharedPref!.getString("userToken") == null
                ? const OnBoarding1()
                : const BottomNav(),
          ),
        );
      },
    );
  }
}
