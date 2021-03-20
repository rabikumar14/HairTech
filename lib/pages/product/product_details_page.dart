import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hair_salon/global_items/app_bar/app_bar.dart';
import 'package:hair_salon/global_items/cart_counter.dart';
import 'package:hair_salon/models/product.dart';
import 'package:hair_salon/pages/theme/theme_export.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({Key key, this.product}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final description =
      'Styling, heat tools, and humidity can all dry out your curls. Lock-in moisture with TRESemmé Pro Care Curls Conditioner, designed to help protect your curls from frizz and humidity.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar("Product Details", color: Colors.grey[200],),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
         
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton.extended(
              onPressed: () {
         
              },
              icon: Icon(Icons.add),
              label: Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ),
          );
        },
      ),
   
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildProductImage(),
            _buildAbout(),
            
              //  Row(mainAxisAlignment: MainAxisAlignment.center,
              //    children: [
              //      CartCounter(),
              //    ],
              //  ),
          ],
        ),
      ),
    );
  }

  _buildProductImage() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey[200],
            Colors.grey[200],
          ],
          stops: [0.1, 1],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Hero(
        tag: widget.product.documentId,
        child: Image.network(
          widget.product.productImg,
          height: 300,
        ),
      ),
    );
  }

  _buildAbout() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.product.productName,
                      style: GoogleFonts.varelaRound(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.product.productCategory,
                      style: GoogleFonts.varelaRound(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey[200],
                        Colors.white,
                      ],
                      stops: [0.1, 1],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    '\$' + widget.product.productPrice.toString(),
                    style: GoogleFonts.varelaRound(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
              widget.product.productDescription,
              style: GoogleFonts.varelaRound(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildAddToCart() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: FlatButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25.0)),
          color: Colors.pink[400],
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.shopping_cart,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              Text("Add to Cart",
                  style: GoogleFonts.varelaRound(
                    color: Colors.white,
                
                    fontSize: 16,
                  ))
            ],
          )),
    );
  }
}
