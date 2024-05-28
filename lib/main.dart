import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //  Add Widgets
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //
  // //  add local storage5
  await GetStorage.init();
  //
  // // Todo: await native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: init firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  // AuthenticationRepository();
  // Todo: init auth

  runApp(const App());
}

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'app.dart';
// import 'data/repositories/authentication/authentication_repository.dart';
// import 'firebase_options.dart';
//
// Future<void> main() async {
//   // Initialize widgets binding
//   // WidgetsFlutterBinding.ensureInitialized();
//
//   // Initialize local storage
//   await GetStorage.init();
//
//   // Preserve native splash
//   // FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
//
//   // Initialize Firebase
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//
//   // Initialize authentication repository
//   Get.put(AuthenticationRepository());
//   // Get.lazyPut(()=>AuthenticationRepository());
//   // FlutterNativeSplash.remove();
//   AuthenticationRepository.instance.screenRedirect();
//
//   // Run the app
//   runApp(const App());
// }