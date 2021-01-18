import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreference {
  static Future<String> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('userLogin');
  }

  static Future<bool> setUser(String value) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.setString('userLogin', value);
  }

  static Future<bool> removeUser() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.clear();
  }
}
