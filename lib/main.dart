import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hair_salon/global_items/nav_rail/nav_rail.dart';
import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/pages/theme/theme_export.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(lightThemePink), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(theme: themeNotifier.getTheme(), home: LandingPage());
  }
}


/// Returns a boolean value whether the window is considered medium or large size.
///
/// Used to build adaptive and responsive layouts.
bool isDisplayDesktop(BuildContext context) =>
    getWindowType(context) >= AdaptiveWindowType.medium;

/// Returns boolean value whether the window is considered medium size.
///
/// Used to build adaptive and responsive layouts.
bool isDisplaySmallDesktop(BuildContext context) {
  return getWindowType(context) == AdaptiveWindowType.medium;
}
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    if(isDisplayDesktop(context) == true)
    {
      return SideNavRail(title: "HairTech");
    }
    else
    {
      return BotNavBar();
    }
  }
}