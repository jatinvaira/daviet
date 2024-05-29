import 'package:daviet/common/widgets/appbar/appbar.dart';
import 'package:daviet/common/widgets/images/t_rounded_image.dart';
import 'package:daviet/common/widgets/products/post_cards/post_card_horizontal.dart';
import 'package:daviet/common/widgets/texts/section_heading.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/constants/image_strings.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.dark,
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Clubs of Daviet'),
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
                    showActionButton: false,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems ,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
                        itemBuilder: (context, index) =>
                            const TPostCardHorizontal()),
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
