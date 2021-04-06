import 'package:Beautech/admin/dev_adminside/add_new_user.dart';
import 'package:Beautech/admin/dev_adminside/orders_data_table.dart';
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

class NavRailDev extends StatefulWidget {
  NavRailDev({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NavRailDevState createState() => _NavRailDevState();
}

class _NavRailDevState extends State<NavRailDev> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    SalonDataTable(),
    ProductOrderDataTable(),
    ProductDataTable(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => EmailSignInProvider(),
        child: Builder(
          builder: (context) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 2,
                ),
                body: Row(
                  children: [
                    NavigationRail(
                      backgroundColor: Colors.white,
                      extended:
                          isDisplayDesktop(context) == true ? true : false,
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      destinations: const <NavigationRailDestination>[
                        NavigationRailDestination(
                          icon: Icon(Icons.shop_outlined),
                          selectedIcon: Icon(Icons.shop_outlined),
                          label: Text('Salons'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.payment_outlined),
                          selectedIcon: Icon(Icons.payment),
                          label: Text('Orders'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.shopping_cart_outlined),
                          selectedIcon: Icon(Icons.shopping_cart),
                          label: Text('Products'),
                        ),
                      ],
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddNewUser()));
                          },
                          icon: Icon(
                            Icons.person,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            final provider = Provider.of<EmailSignInProvider>(
                                context,
                                listen: false);
                            provider.logout(context);
                          },
                          icon: Icon(
                            Icons.logout,
                            color: Colors.pink,
                          ),
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
