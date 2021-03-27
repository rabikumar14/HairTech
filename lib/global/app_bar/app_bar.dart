
import 'package:Beautech/global/widget_export.dart';
import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String title;
  final List<Widget> action;
  final bool isCenter;
  final double elevation;

  final Color color;

  GlobalAppBar(
    this.title, {
    this.action,
    Key key,
    this.color, this.isCenter, this.elevation,
  })  : preferredSize = Size.fromHeight(56),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation == null ? 0 : elevation,
      backgroundColor:
          color != null ? color : Theme.of(context).backgroundColor,
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      centerTitle: isCenter == null ? true : false,
      title: textFont(title, Theme.of(context).primaryColor,
          fontWeight: FontWeight.w400 ,fontSize: 18),
      actions: 
      action
      
    );
  }
}
