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
          Icons.favorite,
          route: () {},
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [ProductDetailsImage(), ProductDetailsAbout()],
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.73),
                child: AddToCart())
          ],
        ),
      ),
    );
  }
}
