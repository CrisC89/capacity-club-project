import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkModeOn = false;

  static final ThemeProvider _instance = ThemeProvider._internal();

  // Constructeur privé pour empêcher l'instanciation en dehors de cette classe
  ThemeProvider._internal();

  // Méthode statique pour récupérer l'instance unique de AuthProvider
  factory ThemeProvider() {
    return _instance;
  }

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      isDarkModeOn = true;
      _themeMode = ThemeMode.dark;
    } else {
      isDarkModeOn = false;
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
