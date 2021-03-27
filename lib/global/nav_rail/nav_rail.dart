import 'package:Beautech/admin/dev_adminside/product_data_table.dart';
import 'package:Beautech/admin/dev_adminside/salon_data_table.dart';
import 'package:Beautech/global/breakpoints.dart';
import 'package:Beautech/pages/account/account_page.dart';
import 'package:Beautech/pages/appointment/appt_page.dart';
import 'package:Beautech/pages/home/homepage.dart';
import 'package:Beautech/pages/product/product_page.dart';
import 'package:flutter/material.dart';


class SideNavRail extends StatefulWidget {
  SideNavRail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SideNavRailState createState() => _SideNavRailState();
}

class _SideNavRailState extends State<SideNavRail> {
  int _selectedIndex = 0;

    List<Widget> pages = [
    ProductDataTable(),
    SalonDataTable(),
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        NavigationRail(
      
          extended: isDisplayDesktop(context) ==  true ? true : false ,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.favorite),
              label: Text('First'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.bookmark_border),
              selectedIcon: Icon(Icons.book),
              label: Text('Second'),
            ),
           
          ],
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
  }
}
