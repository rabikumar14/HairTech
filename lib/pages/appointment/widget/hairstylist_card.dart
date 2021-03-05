import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';

class HairstylistCard extends StatelessWidget {
  HairstylistCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 160,
        width: 160,
        child: FancyCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 45.0,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 10),
              textFont("Alex Dunphy", Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
            ],
          ),
        ),
      ),
    );
  }
}
