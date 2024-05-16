import 'package:daviet/common/widgets/texts/product_p_text.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:daviet/common/widgets/appbar/appbar.dart';
import 'package:daviet/utils/constants/sizes.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: THelperFunctions.isDarkMode(context)? TColors.dark: TColors.light,
      appBar: TAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 8,
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwSections),
          itemBuilder: (_, index) => const Column(
            children: [
              TCartItem(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                      ),
                      // add and remove button

                      TProductQuantityWithAddRemoveButton(),
                    ],
                  ),
                  TProductPText(price: '\$256', isLarge: false)
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
