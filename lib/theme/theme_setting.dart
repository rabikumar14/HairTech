import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/theme/theme_export.dart';
import 'package:flutter/material.dart';


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
