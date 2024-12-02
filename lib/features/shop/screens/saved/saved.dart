import 'package:buxx/common/widgets/appbar/appbar.dart';
import 'package:buxx/common/widgets/icons/t_circular_icon.dart';
import 'package:buxx/common/widgets/layouts/grid_layout.dart';
import 'package:buxx/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:buxx/features/shop/screens/home/home.dart';
import 'package:buxx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../models/product_model.dart';

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
              TGridLayout(itemCount: 4, itemBuilder: (_, index) =>  TProductCardVertical(product: ProductModel.empty()))
            ],
          ),
        ),
      ),
    );
  }
}
