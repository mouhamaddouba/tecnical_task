import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();
  factory SharedPreferencesService() => _instance;
  SharedPreferencesService._internal();

  static const String _keyIsLoggedIn = 'is_logged_in';

  /// Initialize SharedPreferences
  Future<void> init() async {
    await SharedPreferences.getInstance();
  }

  /// Save login state
  Future<bool> setLoggedIn(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(_keyIsLoggedIn, isLoggedIn);
  }

  /// Get login state
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  /// Clear login state
  Future<bool> clearLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(_keyIsLoggedIn);
  }
}

