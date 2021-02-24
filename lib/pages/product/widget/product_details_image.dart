import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';

class ProductDetailsImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          textFont(
            'Conditioner',
            Theme.of(context).accentColor,
          ),
          textFont('Nivia Men Shampoo', Theme.of(context).accentColor,
              fontWeight: FontWeight.bold, fontSize: 24),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Price\n',
                    style: GoogleFonts.varelaRound(
                        color: Theme.of(context).accentColor),
                  ),
                  TextSpan(
                      text: '\$${25.99}',
                      style: GoogleFonts.varelaRound(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor))
                ]),
              ),
              SizedBox(
                width: 40,
              ),
              Container(
                height: 240,
                width: 220,
                child: Hero(
                  tag: "${22.toString()}",
                  child: Image.network(
                    "https://freepngimg.com/thumb/hair/5-women-hair-png-image.png",
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
