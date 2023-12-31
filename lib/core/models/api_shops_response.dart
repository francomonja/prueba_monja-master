class ShopData {
  int? id;
  String name;
  String description;
  String category;
  List<PromotionData> promotions;

  ShopData({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.promotions,
  });
}

class PromotionData {
  String name;
  String description;
  String price;

  PromotionData({
    required this.name,
    required this.description,
    required this.price,
  });
}

class PromotionApiResponse {
  late List<PromotionData> data;

  PromotionApiResponse({
    required this.data,
  });
}

class ShopsApiResponse {
  late List<ShopData> data;

  ShopsApiResponse({
    required this.data,
  });
}

class ShopNotificationData {
  int? id;
  String? name;
  String? description;
  String? category;

  ShopNotificationData({
    this.id,
    this.name,
    this.description,
    this.category,
  });

  ShopNotificationData.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    description = json['description']?.toString();
    category = json['category']?.toString();
  }
}
