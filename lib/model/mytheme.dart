import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTheme extends ChangeNotifier {
  Color? swatchColor;
  int currentNum = 50;

  Future<void> getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? currentNum = prefs.getInt('themePrefKey');

    this.currentNum = currentNum!;
  }

  MaterialColor customSwatch = const MaterialColor(
    0xFFA4C639,
    const <int, Color>{
      50: const Color(0xFF3FA830),
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('themePrefKey', 50);

    this.currentNum = 50;
    notifyListeners();
  }

  toggleBlue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('themePrefKey', 100);

    this.currentNum = 100;
    notifyListeners();
  }

  toggleCyan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('themePrefKey', 200);

    this.currentNum = 200;
    notifyListeners();
  }

  toggleYellow() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('themePrefKey', 300);

    this.currentNum = 300;
    notifyListeners();
  }

  toggleOrange() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('themePrefKey', 400);

    this.currentNum = 400;
    notifyListeners();
  }

  toggleRed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('themePrefKey', 500);

    this.currentNum = 500;
    notifyListeners();
  }
}
