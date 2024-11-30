import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_with_verified_icon.dart';
class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          imageUrl: DImages.logoLight,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.grey,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        // Title, price, size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'DAVIET'),
              const TProductTitleText(
                title: 'Jatin Vaira',
                maxLines: 1,
              ),
              // attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Semester ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: '6 ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Roll. No. ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: '123/21 ',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
