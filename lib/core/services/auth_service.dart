import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prueba_monja/core/constants/storage_keys.dart';

import '../../app.locator.dart';

class AuthService {
  final FlutterSecureStorage _secureStorage = locator<FlutterSecureStorage>();
  Future<bool> isAuthenticated() async {
    return await _secureStorage.read(key: userToken) != null;
  }
}
