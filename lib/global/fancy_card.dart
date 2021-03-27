import 'package:flutter/material.dart';

class FancyCard extends StatelessWidget {
  final Widget widget;
  final double elevation;
  final double horizontalPadding;
  final double verticalPadding;

  const FancyCard(
    this.widget, {
    Key key, this.elevation, this.horizontalPadding, this.verticalPadding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation != null ? elevation : 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding == null ? 20 : horizontalPadding, vertical: verticalPadding == null ? 10 : verticalPadding),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).canvasColor,
              Theme.of(context).cardColor,
            ],
            stops: [0.1, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget,
      ),
    );
  }
}
