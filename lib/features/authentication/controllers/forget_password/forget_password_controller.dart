import 'package:daviet/data/repositories/authentication/authentication_repository.dart';
import 'package:daviet/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:daviet/utils/helpers/network_manager.dart';
import 'package:daviet/utils/popups/full_screen_loader.dart';
import 'package:daviet/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// send reset pass email
  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing your request...',
          'assets/images/animations/72462-check-register.json');

      /// check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //remove loader
      TFullScreenLoader.stopLoading();

      // Success Screen

      TLoaders.successSnackBar(title: 'Email sent..!', message: 'Password reset link sent on your email.'.tr);


      //redirect
      Get.to(() =>  ResetPassword(email: email.text.trim(),));





    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing your request...',
          'assets/images/animations/72462-check-register.json');

      /// check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email for pass reset
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //remove loader
      TFullScreenLoader.stopLoading();

      // Success Screen

      TLoaders.successSnackBar(title: 'Email sent..!', message: 'Password reset link sent on your email.'.tr);



    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
