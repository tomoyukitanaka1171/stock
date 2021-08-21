import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTheme extends ChangeNotifier {
  Color? currentColor;

  static Future<String?> getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentTheme = prefs.getString('themePrefKey');

    return currentTheme;
  }

  MaterialColor customSwatch = const MaterialColor(
    0xFFA4C639,
    const <int, Color>{
      50: const Color(0xFF1E7CDC),
      100: const Color(0xFF1535B1),
      200: const Color(0xFF29BED2),
      300: const Color(0xFFE7BA16),
      400: const Color(0xFFEC7526),
      500: const Color(0xFFDE3939),
      600: const Color(0xFF9CC033),
      700: const Color(0xFF92B92C),
      800: const Color(0xFF89B124),
      900: const Color(0xFF78A417),
    },
  );

  toggleGreen() async {
    String themePrefKey = "green";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(themePrefKey, themePrefKey);
    final swatchColor = customSwatch[50];
    this.currentColor = swatchColor;
    notifyListeners();
  }

  toggleBlue() async {
    final swatchColor = customSwatch[100];
    this.currentColor = swatchColor;
    notifyListeners();
  }

  toggleCyan() async {
    final swatchColor = customSwatch[200];
    this.currentColor = swatchColor;
    notifyListeners();
  }

  toggleYellow() async {
    final swatchColor = customSwatch[300];
    this.currentColor = swatchColor;
    notifyListeners();
  }

  toggleOrange() async {
    final swatchColor = customSwatch[400];
    this.currentColor = swatchColor;
    notifyListeners();
  }

  toggleRed() async {
    final swatchColor = customSwatch[500];
    this.currentColor = swatchColor;
    notifyListeners();
  }
}
