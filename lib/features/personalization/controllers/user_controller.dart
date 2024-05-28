import 'package:daviet/data/repositories/user/user_repository.dart';
import 'package:daviet/features/authentication/modals/user_model.dart';
import 'package:daviet/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  // save user record from any reg provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // convert name
        final nameParts = UserModel.nameParts(
            userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(
            userCredentials.user!.displayName ?? '');

        // mapdata
        final user = UserModel(id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1
                ? nameParts.sublist(1).join(' ')
                : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '');


        await userRepository.saveUserRecord(user);
      }


    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved', message: 'Something went wrong, try again.');
    }
  }


}