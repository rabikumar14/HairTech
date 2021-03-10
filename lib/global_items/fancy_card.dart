import 'package:hair_salon/global_items/package_export.dart';

class FancyCard extends StatelessWidget {
  final Widget widget;

  const FancyCard(
    this.widget, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
