import 'package:daviet/common/widgets/appbar/appbar.dart';
import 'package:daviet/common/widgets/images/t_circular_image.dart';
import 'package:daviet/common/widgets/texts/section_heading.dart';
import 'package:daviet/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:daviet/utils/constants/image_strings.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
        ),
      ),
      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: DImages.user,
                      isNetworkImage: false,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TProfileMenu(
                onPressed: () {},
                title: 'Name',
                value: 'Jatin Vaira',
              ),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Info
              const TSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  title: 'User ID',
                  value: '123/21',
                  icon: Iconsax.copy,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'E-mail',
                  value: 'jatinvaira@gmail.com',
                  onPressed: () {}),
              TProfileMenu(
                  title: 'Phone Number',
                  value: '+91 94856-98652',
                  onPressed: () {}),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              TProfileMenu(
                  title: 'Date of Birth',
                  value: '05 Jan 2005',
                  onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                  child: TextButton(
                onPressed: () {},
                child: const Text('Close Account',
                    style: TextStyle(color: Colors.red)),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
