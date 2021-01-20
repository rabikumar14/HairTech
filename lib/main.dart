import 'package:flutter/material.dart';
import 'package:hair_salon/pages/setting.dart';
import 'package:hair_salon/widgets/bot_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Settings(),
          bottomNavigationBar: BotNavBar(),
        ),
      ),
    );
  }
}
