import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hair_salon/widgets/bot_nav_bar.dart';
import 'package:hair_salon/pages/temp_test.dart';

import 'themes/colors.dart';
import 'widgets/bot_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
        theme: ThemeData(primaryColor: LightTheme.mainColour),
        home: BotNavBar());
  }
}
