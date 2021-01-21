import 'package:flutter/material.dart';
import 'package:hair_salon/themes/colors.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double elevationValue = 5;
  String languageValue = 'English';
  String themeValue = 'General';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Card(
            elevation: elevationValue,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.language,
                  ),
                  title: Text("Language"),
                  trailing: DropdownButton(
                    value: languageValue,
                    onChanged: (String newLanguageValue) {
                      setState(() {
                        languageValue = newLanguageValue;
                      });
                    },
                    items: <String>['English', 'Chinese', 'Malay', 'Tamil']
                        .map<DropdownMenuItem<String>>((String languageValue) {
                      return DropdownMenuItem<String>(
                        value: languageValue,
                        child: Text(languageValue),
                      );
                    }).toList(),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.colorize,
                  ),
                  title: Text("Colour Theme"),
                  trailing: DropdownButton(
                    value: themeValue,
                    onChanged: (String newThemeValue) {
                      setState(() {
                        themeValue = newThemeValue;
                      });
                    },
                    items: <String>['General', 'Light', 'Dark']
                        .map<DropdownMenuItem<String>>((String themeValue) {
                      return DropdownMenuItem<String>(
                        value: themeValue,
                        child: Text(themeValue),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Misc',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Card(
            elevation: elevationValue,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.branding_watermark,
                  ),
                  title: Text("Terms & Conditions"),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.supervised_user_circle_sharp,
                  ),
                  title: Text("Development Team"),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
