import 'package:cached_network_image/cached_network_image.dart';
import 'package:daviet/features/shop/models/product_model.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = ''.obs;

  ///  Get all images from product and variations
  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};
    //load thumbnail
    images.add(product.thumbnail);

    // assign thumbnail image
    selectedProductImage.value = product.thumbnail;

    // get all images from product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // get all images from the product variation if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  ///   Show image Popup
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: TSizes.defaultSpace * 2,
                  horizontal: TSizes.defaultSpace),
              child: CachedNetworkImage(
                imageUrl: image,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text('close'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
