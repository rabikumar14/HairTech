import 'package:Beautech/admin/dev_adminside/add_new_user.dart';
import 'package:Beautech/admin/dev_adminside/product_data_table.dart';
import 'package:Beautech/admin/dev_adminside/salon_data_table.dart';
import 'package:Beautech/admin/salon_adminside/view_appointments.dart';
import 'package:Beautech/admin/salon_adminside/view_services.dart';
import 'package:Beautech/global/breakpoints.dart';
import 'package:Beautech/pages/account/account_page.dart';
import 'package:Beautech/pages/appointment/appt_page.dart';
import 'package:Beautech/pages/home/homepage.dart';
import 'package:Beautech/pages/product/product_page.dart';
import 'package:Beautech/services/firebase_services/email_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideNavRail extends StatefulWidget {
  SideNavRail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SideNavRailState createState() => _SideNavRailState();
}

class _SideNavRailState extends State<SideNavRail> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    AddNewUser(),
    AppointmentDataTable(),
  ];

  @override
  Widget build(BuildContext context) {
  return ChangeNotifierProvider(
        create: (context) => EmailSignInProvider(),
        child: 
    Builder(
      builder: (context) {
        return Scaffold(
         body: Row(
       children: [
         NavigationRail(
           groupAlignment: 0.0,
           extended: isDisplayDesktop(context) == true ? true : false,
           selectedIndex: _selectedIndex,
           onDestinationSelected: (int index) {
             setState(() {
               _selectedIndex = index;
             });
           },
           destinations: const <NavigationRailDestination>[
             NavigationRailDestination(
               icon: Icon(Icons.shopping_bag_outlined),
               selectedIcon: Icon(Icons.shopping_bag),
               label: Text('Products'),
             ),
             NavigationRailDestination(
               icon: Icon(Icons.shop_outlined),
               selectedIcon: Icon(Icons.shop),
               label: Text('Salons'),
             ),
           ],
           trailing: Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.end,
             children: [
               IconButton(
                 onPressed: () {
                   final provider =
                       Provider.of<EmailSignInProvider>(context, listen: false);
                   provider.logout(context);
                 },
                 icon: Icon(Icons.logout),
               ),
             ],
           ),
         ),
         const VerticalDivider(thickness: 1, width: 1),
         // This is the main content.
          Expanded(
           child: Center(
             child: pages[_selectedIndex],
           ),
         )
       ],
        ));
    },
    ));
  }
}
