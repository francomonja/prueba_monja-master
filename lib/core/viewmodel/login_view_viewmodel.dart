import 'package:flutter/material.dart';
import 'package:prueba_monja/app.locator.dart';
import 'package:prueba_monja/app.router.dart';
import 'package:prueba_monja/core/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewViewModel extends BaseViewModel {
  final TextEditingController userController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final NavigationService _navigationService = NavigationService();
  final AuthService _authService = locator<AuthService>();
  void registerController() async {
    setBusy(true);
    try {
      _authService.onRegister(userController.text, passwordController.text);
    } catch (e) {
      print(e);
    }
    setBusy(false);
  }

  void loginController() async {
    setBusy(true);

    try {
      await _authService.onLogIn(userController.text, passwordController.text);
      if (await _authService.isAuthenticated()) {
        _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
      }
    } catch (e) {
      print(e);
    }
    setBusy(false);
  }

  void googleController() async {
    setBusy(true);

    try {
      await _authService.googleLogIn();
      if (await _authService.isAuthenticated()) {
        _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
      }
    } catch (error) {
      print(error);
    }
    setBusy(false);
  }
}
