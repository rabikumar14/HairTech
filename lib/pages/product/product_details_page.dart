import 'package:flutter/material.dart';
import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/pages/cart/cart_page.dart';
import 'package:hair_salon/pages/product/widget/add_cart_button.dart';
import 'package:hair_salon/pages/product/widget/product_details_about.dart';
import 'package:hair_salon/pages/product/widget/product_details_image.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key key}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: GlobalAppBar(
        'Product Details',
        action: AppBarAction(
          Icons.shopping_cart,
          route: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CartPage()));
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.883,
                  child: Stack(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.03,
                              left: 20,
                              right: 20),
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.33),
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: ProductDetailsAbout()),
                      ProductDetailsImage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.73),
              child: AddToCart())
        ],
      ),
    );
  }
}
