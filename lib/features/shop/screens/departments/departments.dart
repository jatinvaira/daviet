import 'package:daviet/common/widgets/appbar/appbar.dart';
import 'package:daviet/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:daviet/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:daviet/common/widgets/layouts/grid_layout.dart';
import 'package:daviet/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:daviet/common/widgets/texts/section_heading.dart';
import 'package:daviet/common/widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/constants/enums.dart';
import 'package:daviet/utils/constants/image_strings.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/images/t_circular_image.dart';

class Departments extends StatelessWidget {
  const Departments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.dark,
      appBar: TAppBar(
        showBackArrow: false,
        title: Text(
          'Departments',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        // actions: [
        //   TCartCounterIcon(onPressed: (){}, iconColor: CupertinoColors.darkBackgroundGray)
        // ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : TColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    // Search Bar

                    const TSearchContainer(
                      text: 'Search Here',
                      showBackground: true,
                      showBorder: true,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    // Featured Departments
                    TSectionHeading(
                      title: 'Featured Departments',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 1.5,
                    ),

                    TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: TRoundedContainer(
                              padding: const EdgeInsets.all(TSizes.sm),
                              showBorder: true,
                              backgroundColor: Colors.transparent,
                              child: Row(
                                // icon
                                children: [
                                  const Flexible(
                                    child: TCircularImage(
                                      image: DImages.csedep,
                                      isNetworkImage: false,
                                      backgroundColor: Colors.transparent,
                                      // overlayColor:
                                      // THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: TSizes.spaceBtwItems / 2,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const TBrandTitleWithVerifiedIcon(
                                          title: 'CSE',
                                          brandTextSizes: TextSizes.large,
                                        ),
                                        Text(
                                          '250 Posts',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(),
      ),
    );
  }
}
