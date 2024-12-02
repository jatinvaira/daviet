import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../features/shop/models/product_model.dart';
import '../../utils/constants/enums.dart';
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

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
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


  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
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
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw 'User is not authenticated';
      }

      final storage = Get.put(TFirebaseStorageService());
      final batch = _db.batch();

      for (var product in products) {
        // Upload and update the thumbnail image
        product.thumbnail =
            await uploadImage('Products/Images', product.thumbnail);

        // Upload and update additional product images
        if (product.images?.isNotEmpty == true) {
          product.images = await Future.wait(product.images!.map((image) async {
            return await uploadImage('Products/Images', image);
          }).toList());
        }

        // Upload and update variation images for variable products
        if (product.productType == ProductType.variable.name &&
            product.productVariations != null) {
          for (var variation in product.productVariations!) {
            variation.image =
                await uploadImage('Products/Images', variation.image);
          }
        }

        // Add Firestore write to batch
        final productRef = _db.collection("Products").doc(product.id);
        batch.set(productRef, product.toJson());
      }

      // Commit batch write
      await batch.commit();
      if (kDebugMode) {
        print('All products uploaded successfully.');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading data: $e');
      }
      rethrow; // Rethrow for further handling if needed
    }
  }

  Future<String> uploadImage(String path, String imageName) async {
    final storage = Get.find<TFirebaseStorageService>();
    final imageData = await storage.getImageDataFromAssets(imageName);
    return await storage.uploadImageData(path, imageData, imageName);
  }
}
