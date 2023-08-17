import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:prueba_monja/core/services/flutter_firebase_messaging_background_service.dart';
import 'package:prueba_monja/firebase_options.dart';
import 'package:prueba_monja/ui/setup_dialog_ui.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import 'app.router.dart';
import 'core/services/auth_service.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  print("Handling a background message: ${message.messageId}");
}

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    setupDialogUi();
    FlutterFirebaseMessagingBackgroundService _notificationService = locator<FlutterFirebaseMessagingBackgroundService>();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    _notificationService.init();
    await _notificationService.requestPermissions();
    await _notificationService.getDeviceToken();
    AuthService authService = locator<AuthService>();
    String initialRoute = await authService.isAuthenticated() ? Routes.homeView : Routes.loginView;

    runApp(MyApp(
      initialRoute: initialRoute,
    ));
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({
    Key? key,
    required this.initialRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return OverlaySupport.global(
        child: MaterialApp(
      title: 'Roadmap',
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: false,
    ));
  }
}
