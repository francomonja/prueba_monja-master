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
    apiKey: 'AIzaSyCp5EQ8iA5QAf3FgLE6oe1F8H4Y2592J2w',
    appId: '1:759431317728:web:9704cacfc9df381e4b2885',
    messagingSenderId: '759431317728',
    projectId: 'flutter-varios-e9ebe',
    authDomain: 'flutter-varios-e9ebe.firebaseapp.com',
    databaseURL: 'https://flutter-varios-e9ebe-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-varios-e9ebe.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA78BIZqMFwwVyIdhw6y5RtLBZhrHWsm6I',
    appId: '1:759431317728:android:683853f2da8656824b2885',
    messagingSenderId: '759431317728',
    projectId: 'flutter-varios-e9ebe',
    databaseURL: 'https://flutter-varios-e9ebe-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-varios-e9ebe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdbrXpYHR1qvCBSYCbWVQzG8V36AjVUoY',
    appId: '1:759431317728:ios:465cc0b9ba58a71f4b2885',
    messagingSenderId: '759431317728',
    projectId: 'flutter-varios-e9ebe',
    databaseURL: 'https://flutter-varios-e9ebe-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-varios-e9ebe.appspot.com',
    iosClientId: '759431317728-qdqvme0a68jtodv27v586dlv3i0pe4u9.apps.googleusercontent.com',
    iosBundleId: 'com.example.pruebaMonja',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdbrXpYHR1qvCBSYCbWVQzG8V36AjVUoY',
    appId: '1:759431317728:ios:465cc0b9ba58a71f4b2885',
    messagingSenderId: '759431317728',
    projectId: 'flutter-varios-e9ebe',
    databaseURL: 'https://flutter-varios-e9ebe-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-varios-e9ebe.appspot.com',
    iosClientId: '759431317728-qdqvme0a68jtodv27v586dlv3i0pe4u9.apps.googleusercontent.com',
    iosBundleId: 'com.example.pruebaMonja',
  );
}
