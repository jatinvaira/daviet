import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daviet/utils/exceptions/firebase_exceptions.dart';
import 'package:daviet/utils/exceptions/format_exceptions.dart';
import 'package:daviet/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/authentication/modals/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// function to store userdata in firestore

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }
}
//
// class UserRepository extends GetxController {
//   static UserRepository get instance => Get.find();
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//
//   /// Function to store user data in Firestore
//   Future<void> saveUserRecord(UserModel user) async {
//     try {
//       await _db.collection("Users").doc(user.id).set(user.toJson());
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again.';
//     }
//   }
//
//   /// Function to fetch user data from Firestore and parse it
//   Future<UserModel> getUserRecord(String userId) async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> document = await _db.collection("Users").doc(userId).get();
//       if (document.exists && document.data() != null) {
//         // Convert document data to JSON string
//         String jsonString = jsonEncode(document.data());
//
//         // Parse the JSON string using the JsonPreprocessor
//         UserModel user = UserModel.fromJson(jsonString);
//         return user;
//       } else {
//         throw 'User not found';
//       }
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again.';
//     }
//   }
// }
