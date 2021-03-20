import 'package:hair_salon/global_items/package_export.dart';

//Main Text & Shadow Colours
final pink = Colors.pinkAccent;
final black = Colors.black;
//Card Gradient Light Theme
final lightGrey = Colors.grey[100];
final white = Colors.white;
//Card Gradient Dark Theme
final grey = Colors.grey[500];
final darkGrey = Colors.grey[800];

//Application Themes
final lightThemePink = ThemeData(
    //Text/Icon/Shadow Colour
    primaryColor: pink,
    //Inactive/Other Colour
    accentColor: black,
    hintColor: darkGrey,
    //Card Gradient Colour
    canvasColor: lightGrey,
    cardColor: white,
    //Background Colour
    backgroundColor: white);

final lightThemeBlack = ThemeData(
    primaryColor: black,
    accentColor: black,
    canvasColor: lightGrey,
    cardColor: white,
    backgroundColor: white);

final darkThemePink = ThemeData(
    primaryColor: pink,
    accentColor: white,
    canvasColor: grey,
    cardColor: darkGrey,
    backgroundColor: darkGrey);

final darkThemeWhite = ThemeData(
    primaryColor: white,
    accentColor: white,
    canvasColor: grey,
    cardColor: darkGrey,
    backgroundColor: darkGrey);
