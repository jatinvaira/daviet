import 'package:daviet/data/repositories/authentication/authentication_repository.dart';
import 'package:daviet/data/repositories/user/user_repository.dart';
import 'package:daviet/features/authentication/modals/user_model.dart';
import 'package:daviet/features/authentication/screens/signup/verify_email.dart';
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
  void signup() async {
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
        TLoaders.warningSnackBar(
            title: 'Accept the privacy policy',
            message:
                "In order to create account, you must read and accept the privacy policy of the institute.");
        return;
      }

      // register user in firebase

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // save authenticated data in firestore

      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // TFullScreenLoader.stopLoading();

      // show success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message:
              'Your account has been created! Verify your email to continue.');

      // move to verify email screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
    finally {
      TFullScreenLoader.stopLoading();
      // Get.to(() => const VerifyEmailScreen());
    }
  }
}
