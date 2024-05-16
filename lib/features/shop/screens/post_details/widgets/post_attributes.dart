import 'package:daviet/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:daviet/common/widgets/texts/product_p_text.dart';
import 'package:daviet/common/widgets/texts/product_title_text.dart';
import 'package:daviet/common/widgets/texts/section_heading.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TPostAttributes extends StatelessWidget {
  const TPostAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const TSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          // const SizedBox(
                          //   width: TSizes.spaceBtwItems,
                          // ),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          const TProductPText(price: '\$20', isLarge: false),
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),

              // variation desc
              const TProductTitleText(
                title:
                'This is desctiption of the product and it can go upto max 4 lines.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,)
      ],
    );
  }
}
