import 'package:daviet/common/widgets/images/t_circular_image.dart';
import 'package:daviet/common/widgets/texts/product_p_text.dart';
import 'package:daviet/common/widgets/texts/product_title_text.dart';
import 'package:daviet/common/widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:daviet/features/shop/controllers/product/product_controller.dart';
import 'package:daviet/utils/constants/enums.dart';
import 'package:daviet/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';

class TProductsMetaData extends StatelessWidget {
  const TProductsMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final ProductController controller;
    final darkMode = THelperFunctions.isDarkMode(context);
    if (ProductController.instance.initialized) {
      controller = ProductController.instance;
    } else {
      controller = ProductController();
    }
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
        right: 0,
        bottom: TSizes.defaultSpace,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // tag
              TRoundedContainer(
                radius: TSizes.sm,
                backgroundColor: TColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm, vertical: TSizes.xs),
                child: Text('$salePercentage%',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.black)),
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),

              if (product.productType == ProductType.single.toString() &&
                  product.salePrice > 0)
                Text(
                  '\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough),
                ),
              if (product.productType == ProductType.single.toString() &&
                  product.salePrice > 0)
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
              TProductPText(
                  price: controller.getProductPrice(product), isLarge: true),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems / 1.5,
          ),
          TProductTitleText(
            title: product.title,
            smallSize: false,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems / 1.5,
          ),
          Row(
            children: [
              const TProductTitleText(
                title: 'Status',
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems / 1.5,
          ),
          Row(
            children: [
              TCircularImage(
                image: product.brand != null ? product.brand!.image : '',
                isNetworkImage: false,
                width: 32,
                height: 32,
                overlayColor: darkMode ? TColors.white : TColors.black,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems / 1.5,
              ),
              TBrandTitleWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSizes: TextSizes.medium,
              ),
            ],
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
        ],
      ),
    );
  }
}
