import 'package:hair_salon/global_items/font.dart';
import 'package:hair_salon/global_items/package_export.dart';

class GlobalAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String title;
  final Widget action;

  GlobalAppBar(
    this.title, {
    this.action,
    Key key,
  })  : preferredSize = Size.fromHeight(56),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      centerTitle: true,
      title: textFont(title, Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold),
      actions: [
        Center(
          child: action,
        )
      ],
    );
  }
}
