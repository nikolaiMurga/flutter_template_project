import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class UserPreferences {
  final _tokenKey = 'token';
  final  _storage= const FlutterSecureStorage();

  UserPreferences();

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> readToken() async {
    final token = await _storage.read(key: _tokenKey);
    return token;
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
