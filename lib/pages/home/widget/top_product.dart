import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';

class TopProduct extends StatelessWidget {
  TopProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 200,
        width: 160,
        child: Container(
          margin: EdgeInsets.only(
            top: 40,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: <Widget>[
              FancyCard(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    textFont(
                      'Nivia Men Shampoo',
                      Theme.of(context).hintColor,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    textFont('Sold: ' + '343', Theme.of(context).accentColor)
                  ],
                ),
              ),
              Positioned(
                top: -40,
                child: Hero(
                  tag: 22.toString(),
                  child: Image.network(
                    "https://www.tresemme.com/content/dam/unilever/tresemme/south_africa/pack_shot/front/hair_care/wash_and_care/tresemm%C3%A9_expert_selection_conditioner_keratin_smooth_750ml/tresemme_keratin_smooth_conditioner_750ml_fop-953090-png.png",
                    height: 140,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
