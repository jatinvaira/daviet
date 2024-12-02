import 'package:buxx/common/widgets/texts/section_heading.dart';
import 'package:buxx/features/shop/models/product_model.dart';
import 'package:buxx/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:buxx/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:buxx/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:buxx/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:buxx/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:buxx/features/shop/screens/product_review/product_reviews.dart';

import 'package:buxx/utils/constants/colors.dart';
import 'package:buxx/utils/constants/enums.dart';

import 'package:buxx/utils/constants/sizes.dart';
import 'package:buxx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductsDetail extends StatelessWidget {
  const ProductsDetail({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      backgroundColor: dark ? TColors.dark : TColors.light,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TProductsImageSlider(product: product),
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),

              // checkout button
              child: Column(
                children: [
                  const TRatingAndShare(),

                  TProductsMetaData(product: product),

                  if (product.productType == ProductType.variable.toString())
                    TProductsAttributes(product: product),

                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(height: TSizes.spaceBtwSections),

                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  // desc
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // reviews
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: 'Reviews(199)',
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewScreen()),
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
