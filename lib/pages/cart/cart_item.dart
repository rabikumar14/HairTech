import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CartItem extends StatelessWidget {

   Product product;
   AppUser cartModel;
   CartItem({Key key, this.product, this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.0, right: 10.0),
              child: Container(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    product.productImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                textFont(product.productName, Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold, fontSize: 14, maxLines: 3),
                Row(
                  children: <Widget>[
                    Text(product.productCategory,
                        style: GoogleFonts.varelaRound(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        )),
                  ],
                ),
                SizedBox(height:10),
                CartCounter(cartModel: cartModel,product: product,)
              ],
            ),
          ],
        ),
        Column(
          children: [
            Center(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "\$" +  double.parse((product.productPrice * product.qty)
                                .toStringAsFixed(2))
                            .toString(),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
