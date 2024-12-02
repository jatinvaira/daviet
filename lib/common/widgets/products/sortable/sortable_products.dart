import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:buxx/features/shop/controllers/all_products_controller.dart';
import 'package:buxx/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class TSortablePosts extends StatelessWidget {
  const TSortablePosts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOptions.value,
          onChanged: (value) {
            // sort product based on selected value
            controller.sortProducts(value!);
          },
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        ///Products
        Obx(
          () => TGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => TProductCardVertical(
                    product: controller.products[index],
                  )),
        )
      ],
    );
  }
}
