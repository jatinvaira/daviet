import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../features/shop/models/product_model.dart';
import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';
import '../firebase_storage_service.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Get an instance of the Firebase Storage service
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        // Get image data link from local assets for the product's thumbnail
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // Upload thumbnail image and get its URL
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // Update the product's thumbnail attribute with the new URL
        product.thumbnail = url;

        // Handle the product's list of additional images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // Get image data link from local assets for each image
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            imagesUrl.add(url);
          }
          // Clear the old image list and add the new URLs
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        // Handle uploading variation images if the product is variable
        // if (product.productType == ProductType.variable.toString()) {
        //   for (var variation in product.productVariations!) {
        //     // Get image data link from local assets for the variation image
        //     final assetImage =
        //         await storage.getImageDataFromAssets(variation.image);
        //
        //     // Upload variation image and get its URL
        //     final url = await storage.uploadImageData(
        //         'Products/Images', assetImage, variation.image);
        //
        //     // Update the variation's image attribute with the new URL
        //     variation.image = url;
        //   }
        // }

        if (product.productType == products.toString()) {
          for (var variation in product.productVariations!) {
            // Get image data link from local assets for the variation image
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            // Upload variation image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            // Update the variation's image attribute with the new URL
            variation.image = url;
          }
        }
        // Store the updated product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
