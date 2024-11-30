import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_p_text.dart';
import '../../../../../utils/constants/sizes.dart';
class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key, required this.showAddRemoveButtons,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 1,
      separatorBuilder: (_, __) =>
      const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) =>  Column(
        children: [
          const TCartItem(),
          if (showAddRemoveButtons) const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          if (showAddRemoveButtons)
            const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),
                  // add and remove button

                  // TProductQuantityWithAddRemoveButton(),
                ],
              ),
              TProductPText(price: 'Rs. 50,000/-', isLarge: false)
            ],
          )
        ],
      ),
    );
  }
}
