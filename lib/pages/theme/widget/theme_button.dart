import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/pages/theme/widget/theme_notifier.dart';

class ThemeButton extends StatelessWidget {
  final ThemeData buttonThemeData;
  final String themeName;

  ThemeButton({@required this.buttonThemeData, @required this.themeName});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return ListTile(
      onTap: () {
        themeNotifier.setTheme(buttonThemeData);
      },
      leading: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: buttonThemeData.backgroundColor),
          child: Text(
            'Test',
            style: TextStyle(color: buttonThemeData.primaryColor),
          )),
      title: Text(
        themeName,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      trailing: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(
          child: child,
          scale: animation,
        ),
        child: _getIcon(themeNotifier),
      ),
    );
  }

  Widget _getIcon(ThemeNotifier themeNotifier) {
    bool selected = (themeNotifier.getTheme() == buttonThemeData);

    return Container(
      key: Key((selected) ? "ON" : "OFF"),
      child: Icon(
        (selected) ? Icons.done : Icons.close,
        color: (selected) ? Colors.green : Colors.red,
        size: 30.0,
      ),
    );
  }
}
