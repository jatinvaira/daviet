import 'package:daviet/common/widgets/appbar/appbar.dart';
import 'package:daviet/features/shop/screens/product_review/widgets/rating_progress_indicator.dart';
import 'package:daviet/features/shop/screens/product_review/widgets/user_review_card.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(
        title: Text('Product Reviews'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Product Reviews are are verified and are from the people who are the Product or any type of connection to the institute.'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              // overall reviews
              const TOverallProductRating(),
              // RatingBarIndicator(
              //   itemBuilder: (_, __) => Icon(Iconsax.star, color: TColors.primary,)
              //
              // ),
              const TRatingBarIndicator(rating: 3.5,),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              // userreviewlist

              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}
