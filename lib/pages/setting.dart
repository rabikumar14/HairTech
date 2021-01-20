import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hair_salon/themes/colors.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(25),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.lock_outline,
                color: Colors.purple,
              ),
              title: Text("Change Password"),
              trailing: Icon(Icons.keyboard),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
