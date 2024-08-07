// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBpy9UMUf-xDPFvI73cssnjWTJongLki2Y',
    appId: '1:524374935070:web:36a6e572c47e63f7d1100f',
    messagingSenderId: '524374935070',
    projectId: 'everest-shop-20f5c',
    authDomain: 'everest-shop-20f5c.firebaseapp.com',
    databaseURL: 'https://everest-shop-20f5c-default-rtdb.firebaseio.com',
    storageBucket: 'everest-shop-20f5c.appspot.com',
    measurementId: 'G-KL1TMQ91NB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAR00o6_AdKbxE5vr7QxAmdIZkpNyI6icE',
    appId: '1:524374935070:android:fafbe433b7634585d1100f',
    messagingSenderId: '524374935070',
    projectId: 'everest-shop-20f5c',
    databaseURL: 'https://everest-shop-20f5c-default-rtdb.firebaseio.com',
    storageBucket: 'everest-shop-20f5c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDF0xpNk3DzcLoMjhAWM8CgJLqlmxwdbIQ',
    appId: '1:524374935070:ios:41e635353aa66365d1100f',
    messagingSenderId: '524374935070',
    projectId: 'everest-shop-20f5c',
    databaseURL: 'https://everest-shop-20f5c-default-rtdb.firebaseio.com',
    storageBucket: 'everest-shop-20f5c.appspot.com',
    iosBundleId: 'com.example.onlineShop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDF0xpNk3DzcLoMjhAWM8CgJLqlmxwdbIQ',
    appId: '1:524374935070:ios:f8d91cfb03c07159d1100f',
    messagingSenderId: '524374935070',
    projectId: 'everest-shop-20f5c',
    databaseURL: 'https://everest-shop-20f5c-default-rtdb.firebaseio.com',
    storageBucket: 'everest-shop-20f5c.appspot.com',
    iosBundleId: 'com.example.onlineShop.RunnerTests',
  );
}
