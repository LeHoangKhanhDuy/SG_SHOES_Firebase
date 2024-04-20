import 'package:app_ban_giay/bindings/general_bindings.dart';
import 'package:app_ban_giay/features/authentication/screens/onboarding/onboarding.dart';
import 'package:app_ban_giay/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBingdings(),
      home: const OnBoardingScreen(),
    );
  }
}
