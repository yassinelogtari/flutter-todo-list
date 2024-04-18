import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  void toggleTheme(bool isDarkModeEnabled) {
    _themeData =
    isDarkModeEnabled ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}
