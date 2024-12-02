import 'package:buxx/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:buxx/features/authentication/screens/login/login.dart';
import 'package:buxx/utils/constants/image_strings.dart';
import 'package:buxx/utils/constants/sizes.dart';
import 'package:buxx/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: THelperFunctions.isDarkMode(context)? TColors.black: TColors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(CupertinoIcons.clear)),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage(DImages.deliveredEmail),
                      width: THelperFunctions.screenWidth() * 0.6,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    // title
                    Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Text(
                      TTexts.changeYourPasswordTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    Text(
                      TTexts.changeYourPasswordSubTitle,
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems * 2),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.offAll(() => const LoginScreen()),
                        child: const Text(TTexts.done),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail,
                        child: const Text(TTexts.resendEmail),
                      ),
                    ),
                  ],
                ))));
  }
}
