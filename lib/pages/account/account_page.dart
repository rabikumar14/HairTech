import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/pages/account/widget/history_card.dart';
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
      appBar: GlobalAppBar(
        '',
        color: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [ProfileCard(), History(), SettingCard()],
        ),
      ),
    );
  }
}
