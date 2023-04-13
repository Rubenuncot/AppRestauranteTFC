import 'package:app_restaurante/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;
  String currentThemeName = 'light';

  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
        currentThemeName = isDarkMode ? 'dark' : 'light';

  setLightMode() {
    currentTheme = AppTheme.lightTheme;
    currentThemeName = 'light';
    notifyListeners();
  }

  setDarktMode() {
    currentTheme = AppTheme.darkTheme;
    currentThemeName = 'dark';
    notifyListeners();
  }
}
