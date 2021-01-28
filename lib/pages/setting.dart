import 'package:flutter/material.dart';
import 'package:hair_salon/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String languageValue = 'English';
  String themeValue = 'Light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightTheme.bgColour,
        iconTheme: IconThemeData(color: LightTheme.mainColour),
        centerTitle: true,
        title: Text(
          'Settings',
          style: GoogleFonts.varelaRound(
            color: LightTheme.mainColour,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Card(
              shadowColor: Colors.grey[300],
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[200],
                      Colors.white,
                    ],
                    stops: [0.1, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'General',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
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
                        items: <String>[
                          'English',
                          'Chinese',
                          'Malay',
                          'Tamil'
                        ].map<DropdownMenuItem<String>>((String languageValue) {
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
                        items: <String>['Light', 'Dark', 'Colourblind']
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
            ),
            Card(
              shadowColor: Colors.grey[300],
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[200],
                      Colors.white,
                    ],
                    stops: [0.1, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Misc',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
