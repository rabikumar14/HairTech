import 'package:Beautech/admin/dev_adminside/add_new_user.dart';
import 'package:Beautech/admin/dev_adminside/product_data_table.dart';
import 'package:Beautech/admin/dev_adminside/salon_data_table.dart';
import 'package:Beautech/admin/salon_adminside/view_appointments.dart';
import 'package:Beautech/admin/salon_adminside/view_outlets.dart';
import 'package:Beautech/admin/salon_adminside/view_services.dart';
import 'package:Beautech/global/breakpoints.dart';
import 'package:Beautech/pages/account/account_page.dart';
import 'package:Beautech/pages/appointment/appt_page.dart';
import 'package:Beautech/pages/home/homepage.dart';
import 'package:Beautech/pages/product/product_page.dart';
import 'package:Beautech/services/firebase_services/email_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavRailSalon extends StatefulWidget {
  NavRailSalon({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NavRailSalonState createState() => _NavRailSalonState();
}

class _NavRailSalonState extends State<NavRailSalon> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    AppointmentDataTable(),
       ServicesDataTable(),
    OutletsDataTable(),
 
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => EmailSignInProvider(),
        child: Builder(
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
                      icon: Icon(Icons.book_online_outlined),
                      selectedIcon: Icon(Icons.book_online),
                      label: Text('Appointments'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.miscellaneous_services_outlined),
                      selectedIcon: Icon(Icons.miscellaneous_services),
                      label: Text('Services'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Outlets'),
                    ),
                  ],
      
                  trailing: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        final provider = Provider.of<EmailSignInProvider>(
                            context,
                            listen: false);
                        provider.logout(context);
                      },
                      icon: Icon(Icons.logout, color:Colors.pink),
                    ),
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
