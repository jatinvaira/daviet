import 'package:daviet/common/widgets/texts/section_heading.dart';
import 'package:daviet/features/shop/models/product_model.dart';
import 'package:daviet/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:daviet/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:daviet/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:daviet/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:daviet/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:daviet/features/shop/screens/product_review/product_reviews.dart';

import 'package:daviet/utils/constants/colors.dart';

import 'package:daviet/utils/constants/sizes.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductsDetail extends StatelessWidget {
  const ProductsDetail({super.key, required this.product,});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      // bottomNavigationBar: const TBottomAddToCart(),
      backgroundColor: dark ? TColors.dark : TColors.light,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TProductsImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              // checkout button
              child: Column(
                children: [
                  const TRatingAndShare(),
                  const TPostMetaData(),
                  const TPostAttributes(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Download button (if needed)'))),
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
                  const ReadMoreText(
                    'Department of Computer Science and Engineering was established in 2001 to offer Bachelor of Technology in Computer Science and Engineering.The department maintains an excellent teaching/learning and research environment with dedicated, qualified and dynamic faculty members and well equipped laboratories.The core competencies of the department include software engineering, computer network and security, soft computing, relational database management system, operating system etc.The products of our department take up careers in various computing industries and large engineering companies, start-up companies, management companies and other government based research organizations.',
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
