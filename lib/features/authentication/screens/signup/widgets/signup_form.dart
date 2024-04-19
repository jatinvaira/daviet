import 'package:daviet/features/authentication/screens/signup/widgets/term_and_conditions.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
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
                labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
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
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
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
              onPressed: () {},
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

