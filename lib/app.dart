import 'package:daviet/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:daviet/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const OnboardingScreen(),
    );
  }
}