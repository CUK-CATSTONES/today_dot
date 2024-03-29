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
    apiKey: 'AIzaSyBaYBG4mYjl2e_MLyHMtOF75DZiSWd7vmo',
    appId: '1:889671983000:web:4bdbdaf959487cd119d5ed',
    messagingSenderId: '889671983000',
    projectId: 'today-dot',
    authDomain: 'today-dot.firebaseapp.com',
    storageBucket: 'today-dot.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBB2J6NuvYB8WNbI-QZ_fIOuyUTxgJO-ZU',
    appId: '1:889671983000:android:48499125a69283e519d5ed',
    messagingSenderId: '889671983000',
    projectId: 'today-dot',
    storageBucket: 'today-dot.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDtZJNWSA9iahuP9dvYXO03-TVle426JU',
    appId: '1:889671983000:ios:1a6838ada608baef19d5ed',
    messagingSenderId: '889671983000',
    projectId: 'today-dot',
    storageBucket: 'today-dot.appspot.com',
    iosClientId:
        '889671983000-0d97u3h3a7jqq72htvr1iobraiq1g3lq.apps.googleusercontent.com',
    iosBundleId: 'com.catstones.todayDot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDtZJNWSA9iahuP9dvYXO03-TVle426JU',
    appId: '1:889671983000:ios:1a6838ada608baef19d5ed',
    messagingSenderId: '889671983000',
    projectId: 'today-dot',
    storageBucket: 'today-dot.appspot.com',
    iosClientId:
        '889671983000-0d97u3h3a7jqq72htvr1iobraiq1g3lq.apps.googleusercontent.com',
    iosBundleId: 'com.catstones.todayDot',
  );
}
