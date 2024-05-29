import 'package:daviet/common/widgets/appbar/appbar.dart';
import 'package:daviet/common/widgets/depts/dept_card.dart';
import 'package:daviet/common/widgets/layouts/grid_layout.dart';
import 'package:daviet/common/widgets/texts/section_heading.dart';
import 'package:daviet/features/shop/screens/brand/brand_products.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Departments'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Heading
              // const TSectionHeading(title: 'Departments', showActionButton: false,),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///brands
              TGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => TBrandCard(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
