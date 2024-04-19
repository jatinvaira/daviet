import 'package:daviet/common/widgets/products/post_cards/post_card_vertical.dart';
import 'package:daviet/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:daviet/features/shop/screens/home/widgets/home_categories.dart';
import 'package:daviet/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:daviet/utils/constants/image_strings.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        // THomeAppBar(),
        const TPrimaryHeaderContainer(
          child: Column(
            children: [
              THomeAppBar(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TSearchContainer(
                text: 'Search in the app',
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Padding(
                padding: EdgeInsets.only(left: TSizes.defaultSpace),
                child: Column(
                  children: [
                    TSectionHeading(
                      title: "Popular Posts",
                      showActionButton: false,
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    THomeCategories(),
                  ],
                ),
              )
            ],
          ),
        ),

        /// body --
        ///

        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: <Widget>[
              const TPromoSlider(
                banners: [
                  DImages.promoBanner1,
                  DImages.promoBanner2,
                  DImages.promoBanner3
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TGridLayout(
                  itemCount: 5,
                itemBuilder: (_, index) => const PostCardVertical(),

              ),
            ],
          ),
        ),
      ],
    )));
  }
}
