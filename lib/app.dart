import 'package:daviet/bindings/genral_bindings.dart';
import 'package:daviet/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:daviet/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialBinding: GeneralBindings(),
        home: const LoginScreen()
        // const OnboardingScreen()

        // const Scaffold(
        //   backgroundColor: TColors.primary,
        //   body: Center(
        //     child: CircularProgressIndicator(
        //       color: TColors.white,
        //     ),
        //   ),
        // )

    );
  }
}
