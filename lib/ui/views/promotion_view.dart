import 'package:flutter/material.dart';
import 'package:prueba_monja/core/models/api_shops_response.dart';
import 'package:stacked/stacked.dart';

import '../../core/viewmodel/promotion_view_viewmodel.dart';

class PromotionView extends StatelessWidget {
  PromotionView({Key? key, required this.promotion}) : super(key: key);
  final PromotionData promotion;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PromotionViewViewModel>.reactive(
        viewModelBuilder: () => PromotionViewViewModel(promotion),
        builder: (context, vm, child) {
          return Scaffold();
        });
  }
}
