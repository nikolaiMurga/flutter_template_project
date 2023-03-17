import 'package:flutter_template_project/data/repo/user/user_preferences.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AuthLocalRepo {
  final UserPreferences _userPreferences;

  AuthLocalRepo(this._userPreferences);

  Future<void> saveToken(String token) async => _userPreferences.saveToken(token);

  Future<String?> readToken() async => _userPreferences.readToken();

  Future<void> clearAll() async => _userPreferences.clearAll();
}
