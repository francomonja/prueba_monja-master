import 'package:flutter/material.dart';
import 'package:prueba_monja/app.router.dart';
import 'package:prueba_monja/core/models/api_shops_response.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app.locator.dart';

class DetailViewViewModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();
  final ShopData shopDetail;
  DetailViewViewModel(this.shopDetail);

  List<PromotionData> results = [];

  void findByPercent(value) {
    if (value == 'all') {
      results = shopDetail.promotions;
    } else {
      results = shopDetail.promotions.where((element) => element.name.contains(value)).toList();
    }
    notifyListeners();
  }

  void init() {
    results = shopDetail.promotions;
    notifyListeners();
  }

  void navigateToPromotionView(promotion) async {
    await _navigationService.navigateToPromotionView(promotion: promotion);
  }
}
