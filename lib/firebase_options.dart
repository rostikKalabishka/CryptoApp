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
    apiKey: 'AIzaSyB08adTCQ_jlPu-oECoihU9t9pqa-P_0b4',
    appId: '1:477905921693:web:8743a02c8336ed66e45674',
    messagingSenderId: '477905921693',
    projectId: 'crypto-app-c1e1b',
    authDomain: 'crypto-app-c1e1b.firebaseapp.com',
    storageBucket: 'crypto-app-c1e1b.appspot.com',
    measurementId: 'G-WEVP1Q2MD1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSAq-VTzyTArVDCVvZYcYHO9p6ipHCht8',
    appId: '1:477905921693:android:967751a7c0f725ade45674',
    messagingSenderId: '477905921693',
    projectId: 'crypto-app-c1e1b',
    storageBucket: 'crypto-app-c1e1b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2Qi6PD8OOknQk2T6heEC-OYNlhhUN5k4',
    appId: '1:477905921693:ios:45f4ee72715ad411e45674',
    messagingSenderId: '477905921693',
    projectId: 'crypto-app-c1e1b',
    storageBucket: 'crypto-app-c1e1b.appspot.com',
    iosBundleId: 'com.example.cryptoApp',
  );
}
