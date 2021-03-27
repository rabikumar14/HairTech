import 'package:Beautech/models/user.dart';
import 'package:Beautech/pages/appointment/appt_page.dart';
import 'package:Beautech/pages/home/homepage.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../pages/page_export.dart';
import '../font.dart';
import '../package_export.dart';
import 'bot_nav_settings.dart';

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

  // List<Widget> loggedInWidgets = [
  //   StreamUserData(widget: HomePage()),
  //   ProductPage(),
  //   StreamUserData(widget: Account())
  // ];

  List<Widget> loggedInWidgets = [
    HomePage(),
    ProductPage(),
    CartPage(),
  Account()
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    List<BottomNavyBarItem> loggedInNavWidgets = [
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
          icon: Icon(Icons.shopping_cart_outlined),
          title: textFont('Cart', Theme.of(context).primaryColor),
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Theme.of(context).accentColor,
          textAlign: TextAlign.center),
      BottomNavyBarItem(
          icon: Icon(Icons.person_outline),
          title: textFont('Account', Theme.of(context).primaryColor),
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Theme.of(context).accentColor,
          textAlign: TextAlign.center),
    ];

    return StreamProvider<AppUser>(
        create: (_) =>
            CRUD().streamAppUser(FirebaseAuth.instance.currentUser.uid),
        initialData: null,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              children: loggedInWidgets),
          bottomNavigationBar: BottomNavyBar(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              backgroundColor: Theme.of(context).backgroundColor,
              selectedIndex: currentIndex,
              showElevation: true,
              itemCornerRadius: 24,
              curve: Curves.easeIn,
              onItemSelected: (index) {
                setState(() => currentIndex = index);
                _pageController.jumpToPage(index);
              },
              items: loggedInNavWidgets),
        ));
  }
}

class BotNavBar2 extends StatefulWidget {
  @override
  _BotNavBar2State createState() => _BotNavBar2State();
}

class _BotNavBar2State extends State<BotNavBar2> {
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

  List<Widget> loggedOutWidgets = [
    HomePage(),
    ProductPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    List<BottomNavyBarItem> loggedOutNavWidgets = [
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
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          children: loggedOutWidgets),
      bottomNavigationBar: BottomNavyBar(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: Theme.of(context).backgroundColor,
          selectedIndex: currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) {
            setState(() => currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: loggedOutNavWidgets),
    );
  }
}
