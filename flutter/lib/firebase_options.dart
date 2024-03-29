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
    apiKey: 'AIzaSyCAB75MKG82KZETnPP2ubZg2X4F01r5rO8',
    appId: '1:783238138416:web:fd0c6df7139113c3923bf5',
    messagingSenderId: '783238138416',
    projectId: 'capcorporate-11496',
    authDomain: 'capcorporate-11496.firebaseapp.com',
    storageBucket: 'capcorporate-11496.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChyr4hjvMElc-SiydZY5C84ijx0sLN68s',
    appId: '1:783238138416:android:3621001114326eb0923bf5',
    messagingSenderId: '783238138416',
    projectId: 'capcorporate-11496',
    storageBucket: 'capcorporate-11496.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4vKRK2MTjPAp5s0901Ao-Dza6-G3UKTs',
    appId: '1:783238138416:ios:9606d5f93cecc725923bf5',
    messagingSenderId: '783238138416',
    projectId: 'capcorporate-11496',
    storageBucket: 'capcorporate-11496.appspot.com',
    iosBundleId: 'com.example.capCorporate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4vKRK2MTjPAp5s0901Ao-Dza6-G3UKTs',
    appId: '1:783238138416:ios:a6ac57dc6a7b7e3c923bf5',
    messagingSenderId: '783238138416',
    projectId: 'capcorporate-11496',
    storageBucket: 'capcorporate-11496.appspot.com',
    iosBundleId: 'com.example.capCorporate.RunnerTests',
  );
}
