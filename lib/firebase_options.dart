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
    apiKey: 'AIzaSyBvg9LgYzPYzfv7v0fbhtq2BGfoK1y2W2w',
    appId: '1:1058476362930:web:c473c520aee64fff4b4dab',
    messagingSenderId: '1058476362930',
    projectId: 'project-flutter-3c75e',
    authDomain: 'project-flutter-3c75e.firebaseapp.com',
    storageBucket: 'project-flutter-3c75e.appspot.com',
    measurementId: 'G-7G77406HEQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPb93CRYpEispMUluHW1DJOJ3DvDEKmgw',
    appId: '1:1058476362930:android:b592fb365d3cd8244b4dab',
    messagingSenderId: '1058476362930',
    projectId: 'project-flutter-3c75e',
    storageBucket: 'project-flutter-3c75e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDl9jTvqGyX8UzxCvW_uO4pApj9GvBAuzA',
    appId: '1:1058476362930:ios:8622fa9c53b35c914b4dab',
    messagingSenderId: '1058476362930',
    projectId: 'project-flutter-3c75e',
    storageBucket: 'project-flutter-3c75e.appspot.com',
    iosBundleId: 'com.example.projectFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDl9jTvqGyX8UzxCvW_uO4pApj9GvBAuzA',
    appId: '1:1058476362930:ios:384b34524a1a9d844b4dab',
    messagingSenderId: '1058476362930',
    projectId: 'project-flutter-3c75e',
    storageBucket: 'project-flutter-3c75e.appspot.com',
    iosBundleId: 'com.example.projectFlutter.RunnerTests',
  );
}