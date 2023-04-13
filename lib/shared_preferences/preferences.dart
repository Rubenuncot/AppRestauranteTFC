import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _isDarkMode = false;
  static String _theme = 'light';

  static Future init() async{
    _prefs = await SharedPreferences.getInstance();
    _isDarkMode ? _prefs.setString('theme', 'dark') : _prefs.setString('theme', 'light');
  }

  static bool get isDarkMode => _prefs.getBool("isDarkMode") ?? _isDarkMode;

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', _isDarkMode);
  }

  static String get theme => _prefs.getString("theme") ?? _theme;

  static set theme(String value) {
    _theme = value;
  }
}