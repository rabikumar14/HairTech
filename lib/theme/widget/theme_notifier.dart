import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/pages/theme/data/theme_data.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = lightThemePink;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}
