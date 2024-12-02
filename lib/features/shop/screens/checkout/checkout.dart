import 'package:buxx/common/widgets/appbar/appbar.dart';
import 'package:buxx/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:buxx/common/widgets/success_screen/success_screen.dart';
import 'package:buxx/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:buxx/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:buxx/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:buxx/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:buxx/navigation_menu.dart';
import 'package:buxx/utils/constants/colors.dart';
import 'package:buxx/utils/constants/image_strings.dart';
import 'package:buxx/utils/constants/sizes.dart';
import 'package:buxx/utils/helpers/helper_functions.dart';
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
          'Order Review',
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
              subTitle: 'Item will be shipped soon',
              onPressed: () => Get.offAll(() => const NavigationMenu())
          )
          ),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
