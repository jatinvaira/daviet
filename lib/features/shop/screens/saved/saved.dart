import 'package:daviet/common/widgets/appbar/appbar.dart';
import 'package:daviet/common/widgets/icons/t_circular_icon.dart';
import 'package:daviet/common/widgets/layouts/grid_layout.dart';
import 'package:daviet/common/widgets/products/post_cards/post_card_vertical.dart';
import 'package:daviet/features/shop/screens/home/home.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: THelperFunctions.isDarkMode(context)? TColors.black: TColors.white,
      appBar: TAppBar(
        showBackArrow: false,
        title: Text('Saved Posts', style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 4, itemBuilder: (_, index) => const PostCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
