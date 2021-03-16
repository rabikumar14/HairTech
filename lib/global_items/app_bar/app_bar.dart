import 'package:hair_salon/global_items/font.dart';
import 'package:hair_salon/global_items/package_export.dart';

class GlobalAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String title;
  final Widget action;
  final bool isCenter;

  final Color color;

  GlobalAppBar(
    this.title, {
    this.action,
    Key key,
    this.color, this.isCenter,
  })  : preferredSize = Size.fromHeight(56),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor:
          color != null ? color : Theme.of(context).backgroundColor,
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      centerTitle: isCenter == null ? true : false,
      title: textFont(title, Theme.of(context).primaryColor,
          fontWeight: FontWeight.w400),
      actions: [
        Center(
          child: action,
        )
      ],
    );
  }
}
