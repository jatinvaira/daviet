import 'package:daviet/common/widgets/login_signup/form_divider.dart';
import 'package:daviet/common/widgets/login_signup/social_buttons.dart';
import 'package:daviet/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:daviet/utils/constants/text_strings.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //         ),
    // ignore: unused_local_variable
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
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

              const TSignupForm(),

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
