import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/models/product.dart';
import 'package:hair_salon/pages/product/product_details_page.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProductDetails(product : product)));
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
                    height: 78,
                  ),
                  textFont(
                    product.productName,
                    Theme.of(context).hintColor,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  textFont(
                    '\$' + product.productPrice.toString(),
                    Theme.of(context).accentColor,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -50,
              child: Hero(
                tag: product.documentId,
                child: Image.network(
                  product.productImg,
                  height: 150,
                  width: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
