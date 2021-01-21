import 'package:flutter/material.dart';
import 'package:hair_salon/themes/colors.dart';
import 'package:hair_salon/widgets/product_tile.dart';
import 'package:hair_salon/pages/products_page.dart';
import 'package:hair_salon/pages/setting.dart';
import 'package:hair_salon/themes/bot_nav_settings.dart';

class BotNavBar extends StatefulWidget {
  @override
  _BotNavBarState createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
        children: <Widget>[
          ProductsPage(),
          ProductsPage(),
          Scaffold(
              body: Container(height: 200, width: 200, child: ProductWidget())),
          Settings(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(7),
        child: BottomNavyBar(
          backgroundColor: LightTheme.bgColour,
          selectedIndex: currentIndex,
          showElevation: false,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) {
            setState(() => currentIndex = index);
            _pageController.jumpToPage(index);
          },
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
      ),
    );
  }
}
