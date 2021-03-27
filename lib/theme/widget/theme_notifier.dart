import 'package:Beautech/theme/data/theme_data.dart';
import 'package:flutter/material.dart';


class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = lightThemePink;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}
