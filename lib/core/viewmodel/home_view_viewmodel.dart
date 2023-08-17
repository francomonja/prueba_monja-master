import 'package:flutter/material.dart';
import 'package:prueba_monja/app.router.dart';
import 'package:prueba_monja/core/enums/dialog_type.dart';
import 'package:prueba_monja/core/models/api_shops_response.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app.locator.dart';

class HomeViewViewModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();
  final TextEditingController search = TextEditingController();
  final DialogService _dialogService = locator<DialogService>();

  List<ShopData> shopsResponse = [
    ShopData(
        category: 'alimento',
        description: 'Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías o de askjhs oalshiuahs lakshk akj asj akjh',
        name: 'tomate',
        promotions: [
          PromotionData(name: '10%', description: 'descuento', price: '9.9'),
          PromotionData(name: '20%', description: 'descuento', price: '5.9'),
          PromotionData(name: '30%', description: 'descuento', price: '7.9'),
          PromotionData(name: '40%', description: 'descuento', price: '7.9'),
        ]),
    ShopData(
        category: 'alimento',
        description: 'Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías o de',
        name: 'lechuga',
        promotions: [PromotionData(name: '10%', description: 'descuento', price: '9.9')]),
    ShopData(
        category: 'alimento',
        description: 'Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías o de',
        name: 'carne',
        promotions: [PromotionData(name: '10%', description: 'descuento', price: '9.9')]),
    ShopData(
        category: 'alimento',
        description: 'Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías o de',
        name: 'pato',
        promotions: [PromotionData(name: '10%', description: 'descuento', price: '9.9')]),
  ];

  List<ShopData> searchResults = [];

  void findByName(value) {
    searchResults = shopsResponse.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    notifyListeners();
  }

  void navigateToDetailView(shopDetail) async {
    await _navigationService.navigateToDetailView(shopDetail: shopDetail);
  }

  void dialog() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.foodForm,
      title: 'hola',
    );
    if (response!.confirmed) {
      ShopData newShop = response.data;
      shopsResponse.insert(0, newShop);
      notifyListeners();
    }
  }

  void onDismiss(index) {
    shopsResponse.removeAt(index);
    notifyListeners();
  }
}
