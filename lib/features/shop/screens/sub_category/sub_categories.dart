import 'package:buxx/common/widgets/appbar/appbar.dart';
import 'package:buxx/common/widgets/images/t_rounded_image.dart';
import 'package:buxx/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:buxx/common/widgets/texts/section_heading.dart';
import 'package:buxx/utils/constants/image_strings.dart';
import 'package:buxx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Clubs of buxx'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(
                imageUrl: DImages.promoBanner1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // SubCategories
              Column(
                children: [
                  TSectionHeading(
                    title: 'ClickEr.',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
                        itemBuilder: (context, index) =>
                             TProductCardVertical(product: ProductModel.empty())),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
