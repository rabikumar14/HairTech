import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/pages/theme/theme_export.dart';

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
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        centerTitle: true,
        title: Text(
          'Settings',
          style: GoogleFonts.varelaRound(
            color: Theme.of(context).primaryColor,
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
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ThemeSetting()),
                      ),
                    )
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
