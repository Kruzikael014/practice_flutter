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
    apiKey: 'AIzaSyA3p0bxzwNH9h4ksBX3uJ-Hz9r0axhqo2Y',
    appId: '1:761082473329:web:94f838805fd39b6932e4d0',
    messagingSenderId: '761082473329',
    projectId: 'flutter-practice-9d4d7',
    authDomain: 'flutter-practice-9d4d7.firebaseapp.com',
    storageBucket: 'flutter-practice-9d4d7.appspot.com',
    measurementId: 'G-5MP1B8DC64',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSUhZWhCGg8Mg6YdiIqIzX1ekJeWCjpTY',
    appId: '1:761082473329:android:031ef9348e2aedbc32e4d0',
    messagingSenderId: '761082473329',
    projectId: 'flutter-practice-9d4d7',
    storageBucket: 'flutter-practice-9d4d7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgVoT76aHD1JZEhu5ENTzU2mSjNLZG2v4',
    appId: '1:761082473329:ios:af6df2457b02ad5d32e4d0',
    messagingSenderId: '761082473329',
    projectId: 'flutter-practice-9d4d7',
    storageBucket: 'flutter-practice-9d4d7.appspot.com',
    iosBundleId: 'com.example.flutterPract',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgVoT76aHD1JZEhu5ENTzU2mSjNLZG2v4',
    appId: '1:761082473329:ios:fdaa6a280f8fb2ac32e4d0',
    messagingSenderId: '761082473329',
    projectId: 'flutter-practice-9d4d7',
    storageBucket: 'flutter-practice-9d4d7.appspot.com',
    iosBundleId: 'com.example.flutterPract.RunnerTests',
  );
}