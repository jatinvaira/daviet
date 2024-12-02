import 'package:buxx/data/repositories/authentication/authentication_repository.dart';
import 'package:buxx/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:buxx/utils/constants/image_strings.dart';
import 'package:buxx/utils/constants/sizes.dart';
import 'package:buxx/utils/constants/text_strings.dart';
import 'package:buxx/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put( VerifyEmailController());
    return Scaffold(
      backgroundColor: THelperFunctions.isDarkMode(context)? TColors.black: TColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // image
                Image(
                  image: const AssetImage(DImages.verifyEmail),
                  width: THelperFunctions.screenWidth() * 0.6,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                // title
                Text(
                  TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Text(
                  email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Text(
                  TTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwItems * 2),
                // buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),

                    child: const Text(TTexts.tContinue),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text(TTexts.resendEmail),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
              ],
            )),
      ),
    );
  }
}
