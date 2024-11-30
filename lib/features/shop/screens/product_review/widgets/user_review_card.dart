import 'package:daviet/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:daviet/common/widgets/products/ratings/rating_indicator.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/image_strings.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(DImages.userProfileImage1),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  'Demo Review',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        // Review

        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '01 Nov, 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job! The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Show less',
          trimCollapsedText: ' Show more',
          moreStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: TColors.primary),
          lessStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: TColors.primary),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        // review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                  ,
                  children: [
                    Text(
                      'Admin',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '02 Nov, 2023',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems,),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job! The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' Show less',
                  trimCollapsedText: ' Show more',
                  moreStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: TColors.primary),
                  lessStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}
