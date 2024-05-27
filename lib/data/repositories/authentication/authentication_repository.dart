import 'package:daviet/features/authentication/screens/login/login.dart';
import 'package:daviet/features/authentication/screens/onboarding/onboarding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  // @override
  void onRedy() {
    // FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnboardingScreen());
  }

  /// Email & Password sign-in

  /// [EmailAuthentication] - SignIn

  /// [EmailAuthentication] - REGISTER

  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailVerification] - MAIL VERIFICATION

  /// [EmailAuthentication] - FORGET PASSWORD

  /// Federated identity & social sign-in

  /// [GoogleAuthentication] - GOOGLE

  /// [FacebookAuthentication] - FACEBOOK

  /// ./end Federated identity & social sign-in

  /// [LogoutUser] - Valid for any authentication.

  /// DELETE USER - Remove user Auth and Firestore Account.
}
