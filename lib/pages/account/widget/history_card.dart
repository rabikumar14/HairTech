import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';

class History extends StatelessWidget {
  const History({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyCard(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textFont('History', Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold, fontSize: 18),
        ListTile(
          leading: Icon(
            Icons.shopping_bag,
          ),
          title: textFont('Transaction History', Theme.of(context).accentColor),
          onTap: () {},
        ),
        CustomDivider(),
        ListTile(
          leading: Icon(
            Icons.account_balance_wallet,
          ),
          title: textFont('Appointment History', Theme.of(context).accentColor),
          onTap: () {},
        ),
      ],
    ));
  }
}
