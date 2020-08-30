import 'package:shared_preferences/shared_preferences.dart';

import 'Constants.dart';

class UserSession {
  static Future<bool> getLoggedIn() async {
    SharedPreferences _prefs = await _sharedPreference();
    final status = _prefs.getBool(loggedIn);
    return status;
  }

  static setLoggedIn() async {
    SharedPreferences _prefs = await _sharedPreference();
    _prefs.setBool(loggedIn, true);
  }

  static Future<SharedPreferences> _sharedPreference() async {
    return SharedPreferences.getInstance();
  }

  static Map<String, String> allUsers = {
    "9898989898": "password123",
    "9876543210": "password123",
    "123": "123"
  };
}
