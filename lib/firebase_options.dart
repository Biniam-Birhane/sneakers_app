// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members

import 'package:firebase_core/firebase_core.dart' show Firebase, FirebaseOptions;

import 'firebase_options.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

Future<void> initializeFirebaseApp() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

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
    apiKey: 'AIzaSyB48TCT10lQ6MJd-1LtLJcE-t1_kaw5vRE',
    appId: '1:436093184485:web:c8d24d00275e1fd35b670c',
    messagingSenderId: '436093184485',
    projectId: 'sneakers-58ad1',
    authDomain: 'sneakers-58ad1.firebaseapp.com',
    storageBucket: 'sneakers-58ad1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDO7l6Zoh0iqPoLQ341UIPsrtbdZqcg4YA',
    appId: '1:436093184485:android:57745a81be9e3cbb5b670c',
    messagingSenderId: '436093184485',
    projectId: 'sneakers-58ad1',
    storageBucket: 'sneakers-58ad1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTgZhHqp3VZJQudVRQfZaPIjd2d7seSac',
    appId: '1:436093184485:ios:2dd99034c1ec64df5b670c',
    messagingSenderId: '436093184485',
    projectId: 'sneakers-58ad1',
    storageBucket: 'sneakers-58ad1.appspot.com',
    iosBundleId: 'com.example.sneakers',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTgZhHqp3VZJQudVRQfZaPIjd2d7seSac',
    appId: '1:436093184485:ios:7eafed39d395ddc05b670c',
    messagingSenderId: '436093184485',
    projectId: 'sneakers-58ad1',
    storageBucket: 'sneakers-58ad1.appspot.com',
    iosBundleId: 'com.example.sneakers.RunnerTests',
  );
}
