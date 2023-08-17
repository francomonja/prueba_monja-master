import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prueba_monja/app.router.dart';
import 'package:prueba_monja/ui/views/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewViewModel extends BaseViewModel {
  final TextEditingController userController = TextEditingController(text: '');
  final TextEditingController passwordController = TextEditingController(text: '');
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final NavigationService _navigationService = NavigationService();
  void registerController() {
    try {
      var usuario = _firebaseAuth.createUserWithEmailAndPassword(
        email: userController.text,
        password: passwordController.text,
      );
    } catch (e) {
      print(e);
    }
  }

  void loginController() {}

  void googleController() async {
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
        await _firebaseAuth.signInWithCredential(credential);
        _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
      }
    } catch (error) {
      print(error);
    }
  }
}
