import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:prueba_monja/ui/views/detail_view.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app.locator.dart';
import '../../ui/constants/app_colors.dart';
import '../models/api_shops_response.dart';

class FlutterFirebaseMessagingBackgroundService {
  final NavigationService _navigationService = locator<NavigationService>();
  void init() {
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? remoteMessage) async {
      ShopNotificationData data = ShopNotificationData.fromJson(remoteMessage!.data);
      ShopData shopDetail = ShopData(name: data.name!, description: data.description!, category: data.category!, promotions: []);

      Future.delayed(const Duration(seconds: 4), () {
        _navigationService.navigateToView(DetailView(shopDetail: shopDetail));
      });
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      String title = '';
      String description = '';
      ShopNotificationData data = ShopNotificationData.fromJson(remoteMessage.data);
      ShopData shopDetail = ShopData(name: data.name!, description: data.description!, category: data.category!, promotions: []);
      if (remoteMessage.notification != null) {
        title = remoteMessage.notification!.title!;
        description = remoteMessage.notification!.body!;
        showOverlayNotification(
          (context) => GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailView(shopDetail: shopDetail),
                )),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
              color: AppColors.secondaryButtonBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.home_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      ShopNotificationData data = ShopNotificationData.fromJson(remoteMessage.data);
      ShopData shopDetail = ShopData(name: data.name!, description: data.description!, category: data.category!, promotions: []);
      _navigationService.navigateToView(DetailView(shopDetail: shopDetail));
    });
  }

  Future<void> requestPermissions() async {
    await FirebaseMessaging.instance.requestPermission(alert: true);

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  Future<String> getDeviceToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);

    return token!;
  }
}
