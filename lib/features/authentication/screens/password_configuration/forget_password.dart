import 'package:daviet/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:daviet/utils/constants/text_strings.dart';
import 'package:daviet/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      backgroundColor: THelperFunctions.isDarkMode(context)? TColors.black: TColors.white,
      appBar: AppBar(),
      body:  Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // heading
          Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: TSizes.spaceBtwItems*2),
          Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: TSizes.spaceBtwItems*2),



          // text field
          Form(
            key: controller.forgetPasswordFormKey,
            child: TextFormField(
              controller: controller.email,
              validator: TValidator.validateEmail,
              decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems*2),

          // submit
          SizedBox(
            width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail() , child: const Text(TTexts.submit)),
          )



        ],
      ),),
    );
  }
}
