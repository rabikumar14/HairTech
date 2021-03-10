import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/star_rating.dart';
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
                foregroundImage: NetworkImage(
                    'https://scontent.fsin9-2.fna.fbcdn.net/v/t1.0-9/74661747_1442722825865598_5378789738956193792_o.jpg?_nc_cat=100&ccb=3&_nc_sid=0debeb&_nc_ohc=fbtwuwDIOTQAX-2n03t&_nc_ht=scontent.fsin9-2.fna&oh=0672c6ae6418fa287ae3f1a2eafaeb47&oe=60631900'),
                radius: 45.0,
                backgroundColor: Colors.transparent,
              ),
              textFont("Alex Dunphy", Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
              StarRating(
                value: 3,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
