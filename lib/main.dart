import 'package:flutter/material.dart';
import 'package:hair_salon/pages/setting.dart';
import 'package:hair_salon/widgets/bot_nav_bar.dart';

import 'themes/colors.dart';
import 'widgets/bot_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: LightTheme.mainColour
      ),
      home: BotNavBar()
    );
  }
}
