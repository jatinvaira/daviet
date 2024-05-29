import 'package:daviet/common/widgets/layouts/grid_layout.dart';
import 'package:daviet/common/widgets/products/post_cards/post_card_vertical.dart';
import 'package:daviet/common/widgets/texts/section_heading.dart';
import 'package:daviet/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/depts/dept_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // department
              const EDeptShowcase(
                images: [
                  DImages.logoDark,
                  DImages.logoLight,
                  DImages.logoLight
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSectionHeading(
                title: 'Heading 1',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const PostCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}
