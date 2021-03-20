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
        height: 180,
        width: 180,
        child: FancyCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 130,
           
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://hairsaloninna.com/wp-content/uploads/2020/01/Hair-Stylist.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: textFont("Alex Dunphy", Theme.of(context).accentColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
              ),
              StarRating(
                value: 3,
                size: 16,
              ),
              SizedBox(height:3),
            ],
          ),
          horizontalPadding: 0,
          verticalPadding: 0,
          elevation: 2,
        ),
      ),
    );
  }
}
