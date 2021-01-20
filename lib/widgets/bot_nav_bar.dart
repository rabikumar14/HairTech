import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/themes/colors.dart';

class BotNavBar extends StatefulWidget {
  @override
  _BotNavBarState createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BottomNavyBar(
        backgroundColor: LightTheme.bgColour,
        selectedIndex: currentIndex,
        showElevation: false,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text('Home'),
              activeColor: LightTheme.mainColour,
              inactiveColor: LightTheme.subColour,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              title: Text('Products'),
              activeColor: LightTheme.mainColour,
              inactiveColor: LightTheme.subColour,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              title: Text('Appointment'),
              activeColor: LightTheme.mainColour,
              inactiveColor: LightTheme.subColour,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Account'),
              activeColor: LightTheme.mainColour,
              inactiveColor: LightTheme.subColour,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
