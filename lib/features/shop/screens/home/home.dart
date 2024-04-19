import 'package:daviet/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:daviet/features/shop/screens/home/widgets/home_categories.dart';
import 'package:daviet/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:daviet/utils/constants/image_strings.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        // THomeAppBar(),
        TPrimaryHeaderContainer(
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
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TPromoSlider(banners: [DImages.promoBanner1, DImages.promoBanner2, DImages.promoBanner3],),
        )
      ],
    )));
  }
}
