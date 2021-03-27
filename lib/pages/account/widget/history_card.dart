import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/models/user.dart';
import 'package:Beautech/pages/account/list_prev_appointment.dart';
import 'package:Beautech/pages/account/list_prev_orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final appUser = Provider.of<AppUser>(context);
    return Card(
      elevation: 4,
    child:  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFont('History', Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold, fontSize: 16),
          ListTile(
            leading: Icon(
              Icons.shopping_bag,
            ),
            title: textFont('Transaction History', Theme.of(context).accentColor, fontSize: 14),
            onTap: () {
              print(appUser.appUserID);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ListOrders(appUser: appUser,)),
              );
            },
          ),
          CustomDivider(),
          ListTile(
            leading: Icon(
              Icons.account_balance_wallet,
            ),
            title: textFont('Appointment History', Theme.of(context).accentColor, fontSize: 14),
            onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ListAppointments(appUser: appUser,)),
              );
            },
          ),
        ],
      ),
    ));
  }
}
