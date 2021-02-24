import 'package:hair_salon/global_items/font.dart';
import 'package:hair_salon/global_items/nav_bar/bot_nav_settings.dart';
import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/pages/page_export.dart';
import 'file:///C:/src/Flutter%20Projects/HairTech/hair_salon/lib/pages/product/widget/product_tile.dart';

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
      backgroundColor: Theme.of(context).backgroundColor,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
        children: <Widget>[
          ProductPage(),
          ProductPage(),
          Scaffold(
              body: Container(height: 200, width: 200, child: ProductWidget())),
          ThemeSetting(),
          //todo uncomment once other pages settled
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(7),
        child: BottomNavyBar(
          backgroundColor: Theme.of(context).backgroundColor,
          selectedIndex: currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) {
            setState(() => currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                icon: Icon(Icons.home_outlined),
                title: textFont('Home', Theme.of(context).primaryColor),
                activeColor: Theme.of(context).primaryColor,
                inactiveColor: Theme.of(context).accentColor,
                textAlign: TextAlign.center),
            BottomNavyBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                title: textFont('Product', Theme.of(context).primaryColor),
                activeColor: Theme.of(context).primaryColor,
                inactiveColor: Theme.of(context).accentColor,
                textAlign: TextAlign.center),
            BottomNavyBarItem(
                icon: Icon(Icons.account_balance_wallet_outlined),
                title: textFont('Appointment', Theme.of(context).primaryColor),
                activeColor: Theme.of(context).primaryColor,
                inactiveColor: Theme.of(context).accentColor,
                textAlign: TextAlign.center),
            BottomNavyBarItem(
                icon: Icon(Icons.person_outline),
                title: textFont('Account', Theme.of(context).primaryColor),
                activeColor: Theme.of(context).primaryColor,
                inactiveColor: Theme.of(context).accentColor,
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
