// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:prueba_monja/core/models/api_shops_response.dart' as _i6;
import 'package:prueba_monja/ui/views/detail_view.dart' as _i3;
import 'package:prueba_monja/ui/views/home_view.dart' as _i2;
import 'package:prueba_monja/ui/views/promotion_view.dart' as _i4;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i7;

class Routes {
  static const homeView = '/home-view';

  static const detailView = '/detail-view';

  static const promotionView = '/promotion-view';

  static const all = <String>{
    homeView,
    detailView,
    promotionView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.detailView,
      page: _i3.DetailView,
    ),
    _i1.RouteDef(
      Routes.promotionView,
      page: _i4.PromotionView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.HomeView(),
        settings: data,
      );
    },
    _i3.DetailView: (data) {
      final args = data.getArgs<DetailViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i3.DetailView(key: args.key, shopDetail: args.shopDetail),
        settings: data,
      );
    },
    _i4.PromotionView: (data) {
      final args = data.getArgs<PromotionViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.PromotionView(key: args.key, promotion: args.promotion),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class DetailViewArguments {
  const DetailViewArguments({
    this.key,
    required this.shopDetail,
  });

  final _i5.Key? key;

  final _i6.ShopData shopDetail;

  @override
  String toString() {
    return '{"key": "$key", "shopDetail": "$shopDetail"}';
  }

  @override
  bool operator ==(covariant DetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.shopDetail == shopDetail;
  }

  @override
  int get hashCode {
    return key.hashCode ^ shopDetail.hashCode;
  }
}

class PromotionViewArguments {
  const PromotionViewArguments({
    this.key,
    required this.promotion,
  });

  final _i5.Key? key;

  final _i6.PromotionData promotion;

  @override
  String toString() {
    return '{"key": "$key", "promotion": "$promotion"}';
  }

  @override
  bool operator ==(covariant PromotionViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.promotion == promotion;
  }

  @override
  int get hashCode {
    return key.hashCode ^ promotion.hashCode;
  }
}

extension NavigatorStateExtension on _i7.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDetailView({
    _i5.Key? key,
    required _i6.ShopData shopDetail,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.detailView,
        arguments: DetailViewArguments(key: key, shopDetail: shopDetail),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPromotionView({
    _i5.Key? key,
    required _i6.PromotionData promotion,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.promotionView,
        arguments: PromotionViewArguments(key: key, promotion: promotion),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDetailView({
    _i5.Key? key,
    required _i6.ShopData shopDetail,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.detailView,
        arguments: DetailViewArguments(key: key, shopDetail: shopDetail),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPromotionView({
    _i5.Key? key,
    required _i6.PromotionData promotion,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.promotionView,
        arguments: PromotionViewArguments(key: key, promotion: promotion),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
