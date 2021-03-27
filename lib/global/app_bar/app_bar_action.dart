import 'package:Beautech/global/package_export.dart';


class AppBarAction extends StatelessWidget {
  final IconData icon;
  final Function route;
  

  const AppBarAction(this.icon, {Key key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 2,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        child: Container(
          child: IconButton(
            onPressed: route,
            icon: Icon(
              icon,
              size: 22,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
