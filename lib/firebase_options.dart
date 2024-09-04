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
    apiKey: 'AIzaSyARlBe0g1eA7jLpbrPpnpN1pv5splHojKc',
    appId: '1:140189375948:web:1e6a6b937988d8a8369169',
    messagingSenderId: '140189375948',
    projectId: 'ap-urban-lease',
    authDomain: 'ap-urban-lease.firebaseapp.com',
    storageBucket: 'ap-urban-lease.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVb7FjzuRQSrAYqzeOns_-RGhfAPs1DVQ',
    appId: '1:140189375948:android:2e6bcd51f3a01ccd369169',
    messagingSenderId: '140189375948',
    projectId: 'ap-urban-lease',
    storageBucket: 'ap-urban-lease.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4b5rpuAJnzJB5B3SAK6qt6LTYO4wdJEA',
    appId: '1:140189375948:ios:a5a3763ed121366f369169',
    messagingSenderId: '140189375948',
    projectId: 'ap-urban-lease',
    storageBucket: 'ap-urban-lease.appspot.com',
    iosBundleId: 'com.example.urbanLease',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4b5rpuAJnzJB5B3SAK6qt6LTYO4wdJEA',
    appId: '1:140189375948:ios:a5a3763ed121366f369169',
    messagingSenderId: '140189375948',
    projectId: 'ap-urban-lease',
    storageBucket: 'ap-urban-lease.appspot.com',
    iosBundleId: 'com.example.urbanLease',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyARlBe0g1eA7jLpbrPpnpN1pv5splHojKc',
    appId: '1:140189375948:web:07a695310a07e8d2369169',
    messagingSenderId: '140189375948',
    projectId: 'ap-urban-lease',
    authDomain: 'ap-urban-lease.firebaseapp.com',
    storageBucket: 'ap-urban-lease.appspot.com',
  );
}
