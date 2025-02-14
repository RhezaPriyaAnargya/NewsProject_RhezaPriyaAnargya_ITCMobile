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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBcvPnfxOomuGwxY0wxuV1XpsM-7rF0v4E',
    appId: '1:1069508037738:web:a85d92e7e060b7b04a4e13',
    messagingSenderId: '1069508037738',
    projectId: 'miniprojectitc-e3de8',
    authDomain: 'miniprojectitc-e3de8.firebaseapp.com',
    storageBucket: 'miniprojectitc-e3de8.firebasestorage.app',
    measurementId: 'G-RR8VCE4JXK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfswufAKf7xhlgZiPjH9wNNpS5NXjFVV4',
    appId: '1:1069508037738:android:c1f4e8eb72e5e9eb4a4e13',
    messagingSenderId: '1069508037738',
    projectId: 'miniprojectitc-e3de8',
    storageBucket: 'miniprojectitc-e3de8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYNVKifYSjYnR9ETv9IWIB7HnACspmsNg',
    appId: '1:1069508037738:ios:836e97881d0d7bc14a4e13',
    messagingSenderId: '1069508037738',
    projectId: 'miniprojectitc-e3de8',
    storageBucket: 'miniprojectitc-e3de8.firebasestorage.app',
    iosBundleId: 'com.example.miniprojectitc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAYNVKifYSjYnR9ETv9IWIB7HnACspmsNg',
    appId: '1:1069508037738:ios:836e97881d0d7bc14a4e13',
    messagingSenderId: '1069508037738',
    projectId: 'miniprojectitc-e3de8',
    storageBucket: 'miniprojectitc-e3de8.firebasestorage.app',
    iosBundleId: 'com.example.miniprojectitc',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBcvPnfxOomuGwxY0wxuV1XpsM-7rF0v4E',
    appId: '1:1069508037738:web:1d1438dcbdf191664a4e13',
    messagingSenderId: '1069508037738',
    projectId: 'miniprojectitc-e3de8',
    authDomain: 'miniprojectitc-e3de8.firebaseapp.com',
    storageBucket: 'miniprojectitc-e3de8.firebasestorage.app',
    measurementId: 'G-K0E42KVTXL',
  );

}