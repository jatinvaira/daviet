import 'package:daviet/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:daviet/common/widgets/images/t_rounded_image.dart';
import 'package:daviet/common/widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/constants/image_strings.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../styles/shadows.dart';
import '../../icons/t_circular_icon.dart';
import '../../texts/product_p_text.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_text.dart';

class PostCardVertical extends StatelessWidget {
  const PostCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            // thumbnail wishlist disc
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  // Thumbnail image
                  const TRoundedImage(
                    imageUrl: DImages.logoLight,
                    applyImageRadius: true,
                  ),
                  Positioned(
                    top: 12,
                    left: 5,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('CSE',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black)),
                    ),
                  ),
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                        size: 20,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: 'Cse Department',
                    maxLines: 2,
                    smallSize: true,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TBrandTitleWithVerifiedIcon(title: 'CSE'),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.sm),
                  child: TProductPText(
                    price: '35.0',
                    isLarge: false,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                      ))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
