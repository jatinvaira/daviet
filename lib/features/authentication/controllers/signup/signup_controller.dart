import 'package:daviet/utils/constants/image_strings.dart';
import 'package:daviet/utils/popups/full_screen_loader.dart';
import 'package:daviet/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///variables
  final privacyPolicy = true.obs;
  final hidePassword = true.obs; // observable for hiding/showing password
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber =
  TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
  GlobalKey<FormState>(); // Form key for form validation

  ///Signup
  Future<void> signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', DImages.logoDark);

      // Check Internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // form validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      // privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(title: 'Accept the privacy policy',
            message: "In order to create account, you must read and accept the privacy policy of the institute.");
      }






    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
