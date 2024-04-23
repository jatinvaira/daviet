import 'package:daviet/features/personalization/screens/settings/settings.dart';
import 'package:daviet/features/shop/screens/departments/departments.dart';
import 'package:daviet/features/shop/screens/home/home.dart';
import 'package:daviet/features/shop/screens/saved/saved.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),

          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.designtools), label: 'Departments'),
            NavigationDestination(
                icon: Icon(Iconsax.heart), label: 'Notifications'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const Departments(),
    const SavedScreen(),
    const SettingScreen(),
  ];
}
