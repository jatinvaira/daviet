// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAMv1K1hqf7QF5TFmrZLPtaIzUIytGJ-aw',
    appId: '1:295190248125:web:dac861c0b9005fc70b55d4',
    messagingSenderId: '295190248125',
    projectId: 'mydaviet',
    authDomain: 'mydaviet.firebaseapp.com',
    storageBucket: 'mydaviet.appspot.com',
    measurementId: 'G-8CZX7JD7D6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB8EDbqB6AbKBHroeoBBGTU7yyK6lChFAw',
    appId: '1:295190248125:android:557b711eff89b1560b55d4',
    messagingSenderId: '295190248125',
    projectId: 'mydaviet',
    storageBucket: 'mydaviet.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDf6XadD0UoTJ1exalwhJpY_sqVrQmXPA',
    appId: '1:295190248125:ios:5b32dc53fe216c230b55d4',
    messagingSenderId: '295190248125',
    projectId: 'mydaviet',
    storageBucket: 'mydaviet.appspot.com',
    androidClientId: '295190248125-h7cmoi8tdmd0dje4bqc1ro22r92p1nep.apps.googleusercontent.com',
    iosClientId: '295190248125-lavo54gpo5u6c5ocrue00tlnup84khvo.apps.googleusercontent.com',
    iosBundleId: 'com.example.daviet',
  );
}
