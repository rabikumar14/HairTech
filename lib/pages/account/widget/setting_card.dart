

import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/theme/theme_export.dart';
import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:4,
     child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textFont('Setting', Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold, fontSize: 16),
            ListTile(
              leading: Icon(
                Icons.language,
              ),
              title: textFont('Language', Theme.of(context).accentColor, fontSize: 14),
            ),
            CustomDivider(),
            ListTile(
              leading: Icon(
                Icons.colorize,
              ),
              title: textFont('Theme', Theme.of(context).accentColor, fontSize: 14),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ThemeSetting()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
