import 'package:daviet/common/widgets/images/t_circular_image.dart';
import 'package:daviet/common/widgets/texts/product_p_text.dart';
import 'package:daviet/common/widgets/texts/product_title_text.dart';
import 'package:daviet/common/widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:daviet/utils/constants/enums.dart';
import 'package:daviet/utils/constants/image_strings.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TPostMetaData extends StatelessWidget {
  const TPostMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(
          left: 0,
          right: 0,
          bottom: TSizes.defaultSpace,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // tag
              TRoundedContainer(
                radius: TSizes.sm,
                backgroundColor: TColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm, vertical: TSizes.xs),
                child: Text('25%',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.black)),
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),

              Text(
                '\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              const TProductPText(price: '\$175', isLarge: true),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems/1.5,
          ),
          const TProductTitleText(
            title: 'THIS IS A TEST DESCRIPTION',
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems/1.5,
          ),

          Row(
            children: [
              const TProductTitleText(
                title: 'Status:',
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems/1.5,
              ),
              Text(
                'Completed',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems/1.5,
          ),

          const Row(
            children: [
              TCircularImage(image: DImages.logoLight, isNetworkImage: false, width: 32, height: 32,),
              SizedBox(width: TSizes.spaceBtwItems/1.5,),
              TBrandTitleWithVerifiedIcon(title: 'CSE', brandTextSizes: TextSizes.medium,),
            ],
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
        ],
      ),
    );
  }
}
