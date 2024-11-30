
import 'package:daviet/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:daviet/features/shop/screens/all_posts/all_posts.dart';
import 'package:daviet/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:daviet/features/shop/screens/home/widgets/home_categories.dart';
import 'package:daviet/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.black
            : TColors.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            // const THomeAppBar(),
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomeAppBar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSearchContainer(
                    text: 'Search in the app',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: "Popular Posts",
                          showActionButton: true,
                          onPressed: () => Get.to(() => const AllPosts()),
                          textColor: Colors.white,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems * 1.5,
                        ),
                        const THomeCategories(),
                        const SizedBox(
                          height: TSizes.spaceBtwSections * 1.5,
                        ),
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
                  const TPromoSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeading(
                    title: 'Popular Posts',
                    showActionButton: true,
                    onPressed: () => Get.to(() => const AllPosts()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text('No Data found!',
                            style: Theme.of(context).textTheme.bodyMedium),
                      );
                    }
                    return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) =>  TProductCardVertical(product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            ),
          ],
        )));
  }
}
