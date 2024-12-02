import 'package:buxx/data/repositories/authentication/authentication_repository.dart';
import 'package:buxx/features/personalization/controllers/user_controller.dart';
import 'package:buxx/utils/constants/image_strings.dart';
import 'package:buxx/utils/helpers/network_manager.dart';
import 'package:buxx/utils/popups/full_screen_loader.dart';
import 'package:buxx/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  ///Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  final deviceStorage = GetStorage();
  @override
  void onInit() {
    var abc = localStorage.read('REMEMBER_ME_EMAIL');
    if(abc != null){
      email.text = localStorage.read('REMEMBER_ME_EMAIL');
      password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    }else {
      return;
    }
    super.onInit();
  }

  /// Email and password sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', DImages.logoLight);

      //check internet
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (isConnected) {
      //   TFullScreenLoader.stopLoading();
      //   return;
      // }
      // form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // remember me
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //login user using email and password auth
      // final userCredentials = await AuthenticationRepository.instance
      //     .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> googleSignIn() async{
    try{
      // start loading
      TFullScreenLoader.openLoadingDialog('Logging you in... ', 'assets/images/animations/72462-check-register.json');

      // check internet connectivity
      final isConnected =await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }
      // google auth
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // save user record
      await userController.saveUserRecord(userCredentials);

      // remove loader
      TFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
}
}
