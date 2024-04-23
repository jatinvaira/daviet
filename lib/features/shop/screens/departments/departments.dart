import 'package:daviet/common/widgets/appbar/appbar.dart';
import 'package:daviet/common/widgets/appbar/tabbar.dart';
import 'package:daviet/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:daviet/common/widgets/layouts/grid_layout.dart';
import 'package:daviet/common/widgets/texts/section_heading.dart';
import 'package:daviet/features/shop/screens/departments/widgets/category_tab.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/depts/dept_card.dart';

class Departments extends StatelessWidget {
  const Departments({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.black
            : TColors.white,
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
                                return const TBrandCard(
                                  showBorder: true,
                                );
                              })
                        ],
                      ),
                    ),
                    bottom: const TTabBar(
                      tabs: [
                        Tab(child: Text('Computer Science')),
                        Tab(child: Text('Information Tech.')),
                        Tab(child: Text('Electronics')),
                        Tab(child: Text('Mechanical')),
                        Tab(child: Text('Electrical')),
                        Tab(child: Text('Civil')),
                        Tab(child: Text('Applied Sci.')),
                        Tab(child: Text('Business')),
                        Tab(child: Text('Computer App.')),
                        Tab(child: Text('BHMCT')),
                      ],
                    ))
              ];
            },
            body: const TabBarView(
              children: [
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
              ],
            )),
      ),
    );
  }
}
