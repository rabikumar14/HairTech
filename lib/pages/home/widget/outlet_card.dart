import 'package:hair_salon/global_items/fancy_card.dart';
import 'package:hair_salon/global_items/font.dart';
import 'package:hair_salon/global_items/package_export.dart';

class OutletCard extends StatefulWidget {
  final String bgImage;

  const OutletCard({Key key, this.bgImage}) : super(key: key);

  @override
  _OutletCardState createState() => _OutletCardState();
}

class _OutletCardState extends State<OutletCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: MediaQuery.of(context).size.width * .6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken),
                image: NetworkImage(
                    'https://scontent.fsin9-2.fna.fbcdn.net/v/t1.0-9/74661747_1442722825865598_5378789738956193792_o.jpg?_nc_cat=100&ccb=3&_nc_sid=0debeb&_nc_ohc=fbtwuwDIOTQAX-2n03t&_nc_ht=scontent.fsin9-2.fna&oh=0672c6ae6418fa287ae3f1a2eafaeb47&oe=60631900'),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).accentColor.withOpacity(0.4)),
              child: textFont('Farrer Payoh Road, Blk 1, #01-21',
                  Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
