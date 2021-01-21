import 'package:flutter/material.dart';
import 'package:hair_salon/themes/colors.dart';

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
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
            'Account',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Card(
            elevation: elevationValue,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.email,
                  ),
                  title: Text("Change Email"),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.lock_outline,
                  ),
                  title: Text("Change Password"),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.phone,
                  ),
                  title: Text("Change Phone Number"),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.home,
                  ),
                  title: Text("Change Address"),
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
