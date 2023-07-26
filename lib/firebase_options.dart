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
    apiKey: 'AIzaSyCo3TeeA8bAV9pX1zZgEQ4PCgoSewzHX6Y',
    appId: '1:243836457135:web:8645c80a3039a89d1e445a',
    messagingSenderId: '243836457135',
    projectId: 'smart-home-system-c612e',
    authDomain: 'smart-home-system-c612e.firebaseapp.com',
    storageBucket: 'smart-home-system-c612e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWRQEIO6-5w38aaYm4dD65OtRapQfnTYE',
    appId: '1:243836457135:android:ae5891019408c7091e445a',
    messagingSenderId: '243836457135',
    projectId: 'smart-home-system-c612e',
    storageBucket: 'smart-home-system-c612e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4Z0Yek4NZU3Rq6jAfReTFEkbI3ajDGSA',
    appId: '1:243836457135:ios:01156f9d24d045b21e445a',
    messagingSenderId: '243836457135',
    projectId: 'smart-home-system-c612e',
    storageBucket: 'smart-home-system-c612e.appspot.com',
    iosClientId: '243836457135-j0v7b1g0jt9622ls05innp60ifskvu2p.apps.googleusercontent.com',
    iosBundleId: 'com.smartHomeSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4Z0Yek4NZU3Rq6jAfReTFEkbI3ajDGSA',
    appId: '1:243836457135:ios:15ea7185b3966ff81e445a',
    messagingSenderId: '243836457135',
    projectId: 'smart-home-system-c612e',
    storageBucket: 'smart-home-system-c612e.appspot.com',
    iosClientId: '243836457135-07mu4f1bcielgtp7k5c47e5iqbt54bm0.apps.googleusercontent.com',
    iosBundleId: 'com.smartHomeSystem.RunnerTests',
  );
}
