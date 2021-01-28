import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/colors.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key key}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final description =
      'Styling, heat tools, and humidity can all dry out your curls. Lock-in moisture with TRESemmé Pro Care Curls Conditioner, designed to help protect your curls from frizz and humidity.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildProductImage(),
            _buildAbout(),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: LightTheme.bgColour,
      iconTheme: IconThemeData(color: LightTheme.mainColour),
      centerTitle: true,
      title: Text(
        'Product Details',
        style: GoogleFonts.varelaRound(
          color: LightTheme.mainColour,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.favorite,
                  size: 20,
                  color: LightTheme.mainColour,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildProductImage() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey[200],
            Colors.white,
          ],
          stops: [0.1, 1],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Hero(
        tag: 22.toString(),
        child: Image.network(
          "https://www.tresemme.com/content/dam/unilever/tresemme/south_africa/pack_shot/front/hair_care/wash_and_care/tresemm%C3%A9_expert_selection_conditioner_keratin_smooth_750ml/tresemme_keratin_smooth_conditioner_750ml_fop-953090-png.png",
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
                      "Nivia Men Shampoo",
                      style: GoogleFonts.varelaRound(
                        color: LightTheme.mainColour,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Conditioner",
                      style: GoogleFonts.varelaRound(
                        color: LightTheme.mainColour,
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
                    '\$' + 25.99.toString(),
                    style: GoogleFonts.varelaRound(
                      color: LightTheme.mainColour,
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
              description,
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
              borderRadius: new BorderRadius.circular(30.0)),
          color: LightTheme.mainColour,
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.shopping_cart,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              Text("Add to Cart",
                  style: GoogleFonts.varelaRound(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ))
            ],
          )),
    );
  }
}

class _AvailableColor extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const _AvailableColor({
    Key key,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      padding: EdgeInsets.all(isSelected ? 1.5 : 0),
      decoration: isSelected
          ? BoxDecoration(
              border: Border.all(
                color: LightTheme.mainColour,
              ),
              shape: BoxShape.circle,
            )
          : BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
