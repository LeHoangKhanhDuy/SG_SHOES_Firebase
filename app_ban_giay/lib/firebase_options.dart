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
    apiKey: 'AIzaSyDuJ1u130DZ_N09iC8uYi99Br_jVTSafFU',
    appId: '1:490029310094:web:d9e075966bb8601ac6a9df',
    messagingSenderId: '490029310094',
    projectId: 'flutter-app-sgshoes',
    authDomain: 'flutter-app-sgshoes.firebaseapp.com',
    storageBucket: 'flutter-app-sgshoes.appspot.com',
    measurementId: 'G-KPN72KGDZ9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDabjp3IMX-7IHvjcNHWLrSzV0-UVRdsUM',
    appId: '1:490029310094:android:8f3ad78033457dabc6a9df',
    messagingSenderId: '490029310094',
    projectId: 'flutter-app-sgshoes',
    storageBucket: 'flutter-app-sgshoes.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBY3iJu-aYp1KOZ24mPqK0WSBvPxzcJ3cM',
    appId: '1:490029310094:ios:9a0be8047ecab721c6a9df',
    messagingSenderId: '490029310094',
    projectId: 'flutter-app-sgshoes',
    storageBucket: 'flutter-app-sgshoes.appspot.com',
    androidClientId: '490029310094-4tplm14t43kf27saqaskn14tm9kt10su.apps.googleusercontent.com',
    iosClientId: '490029310094-m5k4h5bo09iqi793cfnvp0nmbho0oivr.apps.googleusercontent.com',
    iosBundleId: 'com.example.appBanGiay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBY3iJu-aYp1KOZ24mPqK0WSBvPxzcJ3cM',
    appId: '1:490029310094:ios:7e0cf0c6c0f8ff11c6a9df',
    messagingSenderId: '490029310094',
    projectId: 'flutter-app-sgshoes',
    storageBucket: 'flutter-app-sgshoes.appspot.com',
    androidClientId: '490029310094-4tplm14t43kf27saqaskn14tm9kt10su.apps.googleusercontent.com',
    iosClientId: '490029310094-ie7fueoql5a2iskmrg9flqk7rhrcs6vk.apps.googleusercontent.com',
    iosBundleId: 'com.example.appBanGiay.RunnerTests',
  );
}
