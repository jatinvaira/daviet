import 'package:daviet/common/widgets/appbar/appbar.dart';
import 'package:daviet/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:daviet/common/widgets/success_screen/success_screen.dart';
import 'package:daviet/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:daviet/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:daviet/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:daviet/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:daviet/navigation_menu.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/constants/image_strings.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Payment Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // coupon feild
              const TCouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // billing section
              TRoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    // pricing
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    // divider
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    // payment meathods
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    // address
                    TBillingAddressSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
              image: DImages.successfulPaymentIcon,
              title: 'Payment Success!',
              subTitle: 'Fee details will be reflected to your portal soon.',
              onPressed: () => Get.offAll(() => const NavigationMenu())
          )
          ),
          child: const Text('Redirect to Payment'),
        ),
      ),
    );
  }
}
