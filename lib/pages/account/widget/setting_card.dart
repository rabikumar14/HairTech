import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/pages/theme/theme_export.dart';

class SettingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FancyCard(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textFont('Setting', Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold, fontSize: 18),
            ListTile(
              leading: Icon(
                Icons.language,
              ),
              title: textFont('Language', Theme.of(context).accentColor),
            ),
            CustomDivider(),
            ListTile(
              leading: Icon(
                Icons.colorize,
              ),
              title: textFont('Theme', Theme.of(context).accentColor),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ThemeSetting()),
              ),
            ),
            textFont('Misc', Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold, fontSize: 18),
            ListTile(
              leading: Icon(
                Icons.branding_watermark,
              ),
              title:
                  textFont('Terms & Conditions', Theme.of(context).accentColor),
              onTap: () {},
            ),
            CustomDivider(),
            ListTile(
              leading: Icon(
                Icons.supervised_user_circle_sharp,
              ),
              title:
                  textFont('Development Team', Theme.of(context).accentColor),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
