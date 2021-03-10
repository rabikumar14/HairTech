import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/pages/account/widget/history_card.dart';
import 'package:hair_salon/pages/account/widget/misc_card.dart';
import 'package:hair_salon/pages/account/widget/profile_card.dart';
import 'package:hair_salon/pages/account/widget/setting_card.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: [
          ProfileCard(),
          SizedBox(
            height: 3,
          ),
          History(),
          SizedBox(
            height: 3,
          ),
          SettingCard(),
          SizedBox(
            height: 3,
          ),
          MiscCard(),
          SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }
}
