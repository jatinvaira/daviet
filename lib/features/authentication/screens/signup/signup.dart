import 'package:daviet/common/widgets/login_signup/form_divider.dart';
import 'package:daviet/common/widgets/login_signup/social_buttons.dart';
import 'package:daviet/features/authentication/screens/signup/verify_email.dart';
import 'package:daviet/features/authentication/screens/signup/widgets/term_and_conditions.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:daviet/utils/constants/text_strings.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //         ),
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              // form
              Form(
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       children: [
                    //         TextFormField(
                    //           expands: false,
                    //           decoration: const InputDecoration(
                    //             labelText: TTexts.firstName,
                    //             prefixIcon: Icon(Iconsax.user),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     const SizedBox(width: TSizes.spaceBtwInputFields),
                    //     Expanded(
                    //       children: [
                    //         TextFormField(
                    //           expands: false,
                    //           decoration: const InputDecoration(
                    //             labelText: TTexts.lastName,
                    //             prefixIcon: Icon(Iconsax.user),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),

                    // Row(
                    // children: [
                    // Expanded(
                    //   children: [
                    //     TextFormField(
                    //     expands: false,
                    //       decoration: const InputDecoration(
                    //         labelText: TTexts.lastName,
                    //         prefixIcon: Icon(Iconsax.user),
                    //       ),
                    //     ),
                    //   ],
                    // ),],
                    // ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.firstName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),

                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.lastName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.username,
                          prefixIcon: Icon(Iconsax.user_edit)),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.email,
                          prefixIcon: Icon(Iconsax.direct)),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.phoneNo,
                          prefixIcon: Icon(Iconsax.call)),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    const TTermsAndConditionCheckbox(),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    // signup
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            Get.to(() => const VerifyEmailScreen()),
                        child: const Text(TTexts.createAccount),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields * 2),

              DFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Social
              const DSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
