import 'package:Beautech/global/breakpoints.dart';
import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/pages/product/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Center(
                child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 300, maxWidth: 500),
                    child: ProductDetails(product: product)))));
        Feedback.forTap(context);
      },
      child: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Hero(
                  tag: product.documentId,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.1),
                                BlendMode.darken),
                            image: NetworkImage(
                              product.productImg,
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(product.productName,
                  style: GoogleFonts.varelaRound(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),
              Text(
                '\$' + product.productPrice.toString(),
                style: GoogleFonts.varelaRound(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
