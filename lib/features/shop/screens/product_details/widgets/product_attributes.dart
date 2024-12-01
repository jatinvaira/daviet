import 'package:daviet/common/widgets/chips/choice_chip.dart';
import 'package:daviet/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:daviet/common/widgets/texts/product_p_text.dart';
import 'package:daviet/common/widgets/texts/product_title_text.dart';
import 'package:daviet/common/widgets/texts/section_heading.dart';
import 'package:daviet/features/shop/controllers/product/variation_controller.dart';
import 'package:daviet/features/shop/models/product_model.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
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

    return Column(
      children: [
        /// Selected attribute pricing and desc
        // display variation and price and stock when var is selected
        if (controller.selectedVariation.value.id.isNotEmpty)
          Obx(
            () => TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  /// Title, Price and Stock status
                  Row(
                    children: [
                      const TSectionHeading(
                        title: 'Variation',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Price :  ',
                                smallSize: true,
                              ),
                              // const SizedBox(
                              //   width: TSizes.spaceBtwItems,
                              // ),
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .apply(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.red,
                                      ),
                                ),
                              const SizedBox(
                                width: TSizes.spaceBtwItems / 3,
                              ),
                              TProductPText(
                                  price: controller.getVariationPrice(),
                                  isLarge: false),
                            ],
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems / 5),
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Stock : ',
                                smallSize: true,
                              ),
                              const SizedBox(
                                width: TSizes.spaceBtwItems,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  // variation desc

                    const TProductTitleText(
                      title:
                          'vv',
                      smallSize: true,
                      maxLines: 4,
                    ),
                ],
              ),
            ),
          ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!
              .map(
                (attribute) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionHeading(
                        title: attribute.name ?? '', showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Obx(() {
                      return Wrap(
                          spacing: 8,
                          children: attribute.values!.map(
                            (attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;
                              final available = controller
                                  .getAttributeAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);
                              return TChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available
                                      ? (selected) {
                                          if (selected && available) {
                                            controller.onAttributeSelected(
                                                product,
                                                attribute.name ?? '',
                                                attributeValue);
                                          }
                                        }
                                      : null);
                            },
                          ).toList());
                    })
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
