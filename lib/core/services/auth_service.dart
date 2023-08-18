import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prueba_monja/core/constants/storage_keys.dart';

import '../../app.locator.dart';

class AuthService {
  final FlutterSecureStorage _secureStorage = locator<FlutterSecureStorage>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<bool> isAuthenticated() async {
    return await _secureStorage.read(key: userToken) != null;
  }

  Future<void> googleLogIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try {
      final googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final googleAuth = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        String? deviceToken = await userCredential.user!.getIdToken(true);
        _secureStorage.write(key: userToken, value: deviceToken);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> onRegister(email, password) async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onLogIn(email, password) async {
    try {
      final AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      UserCredential? userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      String? deviceToken = await userCredential.user!.getIdToken(true);
      _secureStorage.write(key: userToken, value: deviceToken);
    } catch (e) {
      rethrow;
    }
  }
}
