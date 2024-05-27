
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //  Add Widgets
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding
      .ensureInitialized();
  //
  // //  add local storage5
  await GetStorage.init();
  //
  // // Todo: await native splash
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  // Todo: init firebase
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  //     .then((FirebaseApp value)
  // =>
      Get.put(AuthenticationRepository());
      // ,);
  // Todo: init auth

  runApp(const App());
}
