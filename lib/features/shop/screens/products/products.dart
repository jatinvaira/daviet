import 'package:buxx/common/widgets/appbar/appbar.dart';
import 'package:buxx/common/widgets/appbar/tabbar.dart';
import 'package:buxx/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:buxx/common/widgets/layouts/grid_layout.dart';
import 'package:buxx/common/widgets/texts/section_heading.dart';
import 'package:buxx/features/shop/controllers/category_controller.dart';
import 'package:buxx/features/shop/screens/brand/all_brands.dart';
import 'package:buxx/features/shop/screens/products/widgets/category_tab.dart';
import 'package:buxx/utils/constants/colors.dart';
import 'package:buxx/utils/constants/sizes.dart';
import 'package:buxx/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/depts/dept_card.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.black
            : TColors.white,
        appBar: TAppBar(
          showBackArrow: false,
          title: Text(
            'Products',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            TCartCounterIcon(onPressed: (){}, iconColor: CupertinoColors.darkBackgroundGray)
          ],
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
                          // Featured Products
                          TSectionHeading(
                            title: 'Featured Products',
                            onPressed: () =>
                                Get.to(() => const AllBrandsScreen()),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 1.5,
                          ),

                          TGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return const TBrandCard(
                                  showBorder: true,
                                );
                              })
                        ],
                      ),
                    ),
                    bottom: TTabBar(
                      tabs: categories
                          .map((category) => Tab(
                                child: Text(category.name),
                              ))
                          .toList(),
                    ))
              ];
            },
            body: TabBarView(
                children: categories
                    .map((category) => TCategoryTab(category: category))
                    .toList())),
      ),
    );
  }
}
