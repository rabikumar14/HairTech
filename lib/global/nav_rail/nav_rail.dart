import 'package:flutter/material.dart';

import 'package:hair_salon/pages/account/account_page.dart';
import 'package:hair_salon/pages/appointment/appt_page.dart';
import 'package:hair_salon/pages/home/homepage.dart';
import 'package:hair_salon/pages/product/product_page.dart';

class SideNavRail extends StatefulWidget {
  SideNavRail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SideNavRailState createState() => _SideNavRailState();
}

class _SideNavRailState extends State<SideNavRail> {
  int _selectedIndex = 0;

    List<Widget> pages = [
    HomePage(),
    ProductPage(),
    ApptPage(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        NavigationRail(
      
          extended: true,
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
            NavigationRailDestination(
              icon: Icon(Icons.star_border),
              selectedIcon: Icon(Icons.star),
              label: Text('Third'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.star_border),
              selectedIcon: Icon(Icons.star),
              label: Text('Third'),
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
