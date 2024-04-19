import 'package:daviet/common/styles/spacing_styles.dart';
import 'package:daviet/features/authentication/screens/login/widgets/login_form.dart';
import 'package:daviet/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  get height => null;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            // logo title subtitle
            const DLoginHeader(),

            //form
            const DLoginForm(),

            // Divider
            DFormDivider(dividerText: TTexts.orSignInWith.capitalize!),

            // sized box
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // social login buttons
            const DSocialButtons(),
          ],
        ),
      )),
    );
  }
}
