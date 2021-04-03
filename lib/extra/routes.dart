
import 'package:Beautech/admin/admin_sign_in.dart';
import 'package:Beautech/global/nav_rail/nav_rail.dart';
import 'package:Beautech/pages/home/homepage.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class RouterFluro {
  static FluroRouter router = new FluroRouter();

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
  }

  static var logInHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return LoginPage();
  });

  static var sideNavRailHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return SideNavRail();
  });

  static void defineRoutes() {
    router.define("salon", handler: sideNavRailHandler);
    router.define("login", handler: logInHandler);

    // it is also possible to define the route transition to use
    // router.define("users/:id", handler: usersHandler, transitionType: TransitionType.inFromLeft);
  }
}
