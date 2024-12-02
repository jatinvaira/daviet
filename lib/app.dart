import 'package:buxx/bindings/general_bindings.dart';
import 'package:buxx/routes/app_routes.dart';
import 'package:buxx/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:buxx/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.testMode = true;
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialBinding: GeneralBindings(),
        getPages: AppRoutes.pages,
        home: const Scaffold(
          backgroundColor: TColors.primary,
          body: Center(
            child: CircularProgressIndicator(
              color: TColors.white,
            ),
          ),
        )

    );
  }

}

