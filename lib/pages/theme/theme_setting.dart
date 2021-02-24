import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/pages/theme/theme_export.dart';

class ThemeSetting extends StatefulWidget {
  ThemeSetting();

  @override
  _ThemeSettingState createState() => _ThemeSettingState();
}

class _ThemeSettingState extends State<ThemeSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: GlobalAppBar('Theme Selection'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: FancyCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ThemeButton(
                  buttonThemeData: lightThemePink,
                  themeName: 'Light Theme: Pink'),
              CustomDivider(),
              ThemeButton(
                  buttonThemeData: lightThemeBlack,
                  themeName: 'Light Theme: Black'),
              CustomDivider(),
              ThemeButton(
                  buttonThemeData: darkThemePink,
                  themeName: 'Dark Theme: Pink'),
              CustomDivider(),
              ThemeButton(
                  buttonThemeData: darkThemeWhite,
                  themeName: 'Dark Theme: Black'),
            ],
          ),
        ),
      ),
    );
  }
}
