import 'package:buxx/common/widgets/chips/choice_chip.dart';
import 'package:buxx/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:buxx/common/widgets/texts/product_p_text.dart';
import 'package:buxx/common/widgets/texts/product_title_text.dart';
import 'package:buxx/common/widgets/texts/section_heading.dart';
import 'package:buxx/features/shop/controllers/product/variation_controller.dart';
import 'package:buxx/features/shop/models/product_model.dart';
import 'package:buxx/utils/constants/colors.dart';
import 'package:buxx/utils/constants/sizes.dart';
import 'package:buxx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TProductsAttributes extends StatelessWidget {
  const TProductsAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Selected Variation Details
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title and Pricing Section

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: 'Selected Variation',
                        showActionButton: false,
                      ),
                      if (controller.variationStockStatus.value == 'In Stock')
                        // Pricing Display
                        Row(
                          children: [
                            if (controller.selectedVariation.value.salePrice >
                                0)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.red,
                                      ),
                                ),
                              ),
                            TProductPText(
                              price: controller.getVariationPrice(),
                              isLarge: true, // Highlight the main price
                            ),
                          ],
                        ),
                      if (controller.variationStockStatus.value ==
                          'Out of Stock')
                        Row(
                          children: [
                            const TProductTitleText(
                              title: 'Stock : ',
                              smallSize: true,
                            ),
                            Text(
                              controller.variationStockStatus.value,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 6),
                  // Stock Status
                  // Row(
                  //   children: [
                  //     const TProductTitleText(
                  //       title: 'Stock Status: ',
                  //       smallSize: true,
                  //     ),
                  //     Chip(
                  //       label: Text(controller.variationStockStatus.value),
                  //       backgroundColor: controller.variationStockStatus.value.toLowerCase() == 'in stock'
                  //           ? Colors.green[100]
                  //           : Colors.red[100],
                  //       labelStyle: TextStyle(
                  //         color: controller.variationStockStatus.value.toLowerCase() == 'in stock'
                  //             ? Colors.green[800]
                  //             : Colors.red[800],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  // Variation Description
                  TProductTitleText(
                    title: product.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Product Attributes Section
          ...product.productAttributes!.map((attribute) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TSectionHeading(
                  title: attribute.name ?? '',
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Obx(() {
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: attribute.values!.map((attributeValue) {
                      final isSelected =
                          controller.selectedAttributes[attribute.name] ==
                              attributeValue;
                      final available = controller
                          .getAttributeAvailabilityInVariation(
                            product.productVariations!,
                            attribute.name!,
                          )
                          .contains(attributeValue);
                      return TChoiceChip(
                        text: attributeValue,
                        selected: isSelected,
                        onSelected: available
                            ? (selected) {
                                if (selected) {
                                  controller.onAttributeSelected(
                                    product,
                                    attribute.name ?? '',
                                    attributeValue,
                                  );
                                }
                              }
                            : null,
                      );
                    }).toList(),
                  );
                }),
                const SizedBox(height: TSizes.spaceBtwItems),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
