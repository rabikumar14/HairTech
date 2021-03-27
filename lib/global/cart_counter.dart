import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/models/user.dart';

import 'font.dart';

class CartCounter extends StatefulWidget {
  final AppUser cartModel;
  final Product product;

  CartCounter({Key key, this.cartModel, this.product}) : super(key: key);
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            widget.cartModel
                .updateProduct(widget.product, widget.product.qty - 1);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: textFont(
              widget.product.qty.toString(), Theme.of(context).accentColor,
              fontSize: 16),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              widget.cartModel
                  .updateProduct(widget.product, widget.product.qty + 1);
            }),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 25,
      height: 25,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          primary: Theme.of(context).primaryColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: press,
        child: Icon(
          icon,
          size: 16,
        ),
      ),
    );
  }
}
