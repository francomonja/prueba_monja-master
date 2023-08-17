import 'package:prueba_monja/core/services/flutter_firebase_messaging_background_service.dart';
import 'package:prueba_monja/ui/views/detail_view.dart';
import 'package:prueba_monja/ui/views/home_view.dart';
import 'package:prueba_monja/ui/views/login_view.dart';
import 'package:prueba_monja/ui/views/promotion_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LoginView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: DetailView),
    MaterialRoute(page: PromotionView),
  ],
  dependencies: [
    LazySingleton(
      classType: NavigationService,
    ),
    LazySingleton(
      classType: DialogService,
    ),
    LazySingleton(
      classType: FlutterFirebaseMessagingBackgroundService,
    ),
    Presolve(
      classType: SharedPreferences,
      presolveUsing: SharedPreferences.getInstance,
    )
  ],
)
class AppSetup {}
