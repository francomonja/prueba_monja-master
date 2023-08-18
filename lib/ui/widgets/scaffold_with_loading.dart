import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prueba_monja/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app.locator.dart';
import '../../core/constants/storage_keys.dart';
import '../constants/app_colors.dart';

class ScaffoldWithLoading extends StatelessWidget {
  const ScaffoldWithLoading({
    Key? key,
    this.showAppBar = false,
    this.showEndDrawer = false,
    this.backgroundColor = AppColors.scaffoldBackgroundColor,
    required this.body,
    required this.isBusy,
  }) : super(key: key);

  final bool showAppBar;
  final bool showEndDrawer;
  final Widget body;
  final bool isBusy;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: showAppBar
          ? AppBar(
              title: Text('appbar'),
            )
          : null,
      endDrawer: showEndDrawer
          ? Drawer(
              backgroundColor: Colors.blue,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    title: Text("Cerrar sesion"),
                    onTap: () => logOut(),
                  )
                ],
              ),
            )
          : null,
      body: SafeArea(
        child: Stack(
          children: [
            body,
            Visibility(
              visible: isBusy,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: const Center(child: CircularProgressIndicator()),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void logOut() async {
  final FlutterSecureStorage _secureStorage = locator<FlutterSecureStorage>();
  final NavigationService _navigationService = locator<NavigationService>();
  await GoogleSignIn().signOut();
  await FirebaseAuth.instance.signOut();
  await _secureStorage.delete(key: userToken);
  _navigationService.navigateToLoginView();
}
