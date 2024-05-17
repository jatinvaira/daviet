import 'package:daviet/common/widgets/appbar/appbar.dart';
import 'package:daviet/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:daviet/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:daviet/common/widgets/texts/section_heading.dart';
import 'package:daviet/features/personalization/screens/address/address.dart';
import 'package:daviet/features/shop/screens/payments/payments.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../profile/profile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: THelperFunctions.isDarkMode(context)? TColors.black: TColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                  showBackArrow: false,
                ),
                 TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen()),),
                const SizedBox(
                  height: TSizes.spaceBtwSections * 1.5,
                ),

                // user profile
              ],
            )),

            // body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Academics',
                    subTitle: 'Your academics in one section',
                    onTap: () {},
                  ),TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Your addresses in one section',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.document,
                    title: 'Course Catalog',
                    subTitle: 'Explore available courses',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.calendar_add,
                    title: 'Class Schedule',
                    subTitle: 'View your class timetable',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.teacher,
                    title: 'Degree Progress',
                    subTitle: 'Track your academic progress',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.book_11,
                    title: 'Library Resources',
                    subTitle: 'Access library materials and services',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.user_search4,
                    title: 'Advisor Appointment',
                    subTitle: 'Schedule appointments with your advisor',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.money,
                    title: 'Fee Payments',
                    subTitle: 'Check your previous payments',
                    onTap: () => Get.to(()=> const PaymentsScreen()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.paintbucket,
                    title: 'Theme Settings',
                    subTitle: 'Customize app theme and colors',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.language_circle,
                    title: 'Language Preferences',
                    subTitle: 'Select preferred app language',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification Settings',
                    subTitle: 'Manage app notification preferences',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.lock,
                    title: 'Safe Mode',
                    subTitle: 'Adjust privacy and security settings',
                    onTap: () {},
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.lock,
                    title: 'Geo Location',
                    subTitle: 'To locate youself in the campus',
                    onTap: () {},
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.icon,
                    title: 'About App',
                    subTitle: 'View app information and version',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: (){}, child: const Text('Logout'),),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
