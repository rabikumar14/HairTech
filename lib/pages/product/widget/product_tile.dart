import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/pages/product/product_details_page.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProductDetails()));
        Feedback.forTap(context);
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 50,
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
                    height: 88,
                  ),
                  textFont(
                    'Nivia Men Shampoo',
                    Theme.of(context).primaryColor,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  CustomDivider(),
                  textFont(
                    '\$' + '25.99',
                    Theme.of(context).accentColor,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -50,
              child: Hero(
                tag: 22.toString(),
                child: Image.network(
                  "https://www.tresemme.com/content/dam/unilever/tresemme/south_africa/pack_shot/front/hair_care/wash_and_care/tresemm%C3%A9_expert_selection_conditioner_keratin_smooth_750ml/tresemme_keratin_smooth_conditioner_750ml_fop-953090-png.png",
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
