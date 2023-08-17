import 'package:flutter/material.dart';

import '../models/api_shops_response.dart';

class PromotionViewViewModel extends ChangeNotifier {
  final PromotionData promotion;
  PromotionViewViewModel(this.promotion);
}
