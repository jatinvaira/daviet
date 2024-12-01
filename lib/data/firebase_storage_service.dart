import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFirebaseStorageService extends GetxController {
  static TFirebaseStorageService get instance => Get.find();
  final _firebaseStorage = FirebaseStorage.instance;

  /// Upload Local Assets from IDE
  /// Returns a unit8list containing image data/
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Error loading image data: $e';
    }
  }

  // Future<String> uploadImageData(
  //     String path, Uint8List image, String name) async {
  //   try {
  //     final ref = _firebaseStorage.ref(path).child(name);
  //     await ref.putData(image);
  //     final url = await ref.getDownloadURL();
  //     return url;
  //   } catch (e) {
  //     if (e is FirebaseException) {
  //       throw 'Firebase Exception:  ${e.message}';
  //     } else if (e is SocketException) {
  //       throw 'Network Error: ${e.message}';
  //     } else if (e is PlatformException) {
  //       throw 'Platform Exception: ${e.message}';
  //     } else {
  //       throw 'Something went wrong! please try again.';
  //     }
  //   }
  // }


  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      final metadata = SettableMetadata(contentType: 'image/jpeg'); // Specify metadata if needed
      await ref.putData(image, metadata);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        if (e.code == 'unauthorized') {
          throw 'User does not have permission to perform this action.';
        } else if (e.code == 'cancelled') {
          throw 'The upload was cancelled.';
        } else {
          throw 'Firebase Exception: ${e.message}';
        }
      } else if (e is SocketException) {
        throw 'Network Error: Please check your connection.';
      } else {
        throw 'Unexpected Error: $e';
      }
    }
  }


  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Exception:  ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Something went wrong! please try again.';
      }
    }
  }
}
