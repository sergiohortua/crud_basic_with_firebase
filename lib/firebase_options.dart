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
    apiKey: 'AIzaSyCvEfG7PZWngHXq_3trbDkaSjOfgK9_ypU',
    appId: '1:836779091928:web:d71be7ea2a04dae11bf4ad',
    messagingSenderId: '836779091928',
    projectId: 'crud-with-firebase-686b9',
    authDomain: 'crud-with-firebase-686b9.firebaseapp.com',
    storageBucket: 'crud-with-firebase-686b9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWMXEOggXay-uN0OV7zX4CQMiYuPVa1fo',
    appId: '1:836779091928:android:9573e2b7abaefcf81bf4ad',
    messagingSenderId: '836779091928',
    projectId: 'crud-with-firebase-686b9',
    storageBucket: 'crud-with-firebase-686b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7T2UEqEKUd0ZDwD31BwKlHFD3ck_NY-M',
    appId: '1:836779091928:ios:5786fbfcf9f0484c1bf4ad',
    messagingSenderId: '836779091928',
    projectId: 'crud-with-firebase-686b9',
    storageBucket: 'crud-with-firebase-686b9.appspot.com',
    iosBundleId: 'com.example.crudWithFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7T2UEqEKUd0ZDwD31BwKlHFD3ck_NY-M',
    appId: '1:836779091928:ios:086afa155f56d1221bf4ad',
    messagingSenderId: '836779091928',
    projectId: 'crud-with-firebase-686b9',
    storageBucket: 'crud-with-firebase-686b9.appspot.com',
    iosBundleId: 'com.example.crudWithFirebase.RunnerTests',
  );
}
