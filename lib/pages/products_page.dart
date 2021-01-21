import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hair_salon/pages/cart_page.dart';
import 'package:hair_salon/widgets/product_tile.dart';
import '../themes/colors.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            TabBar(
              labelColor: LightTheme.mainColour,
              unselectedLabelColor: Colors.grey,
              labelStyle: GoogleFonts.varelaRound(fontWeight: FontWeight.w600),
              isScrollable: true,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: LightTheme.mainColour,
                    width: 2,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 45)),
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Shampoo',
                ),
                Tab(
                  text: 'Dyes',
                ),
                Tab(
                  text: 'Conditioners',
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: TabBarView(children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [_buildProducts()],
                    ),
                  ),
                  Container(),
                  Container(),
                  Container(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: LightTheme.mainColour,
      centerTitle: true,
      title: Text(
        'Our Products',
        style: GoogleFonts.varelaRound(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Card(
                elevation: 5,
                child: IconButton(
                  onPressed: () {

                    Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CartPage()));
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 22,
                    color: LightTheme.mainColour,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildProducts() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _buildLeftSide(),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: _buildRightSide(),
          ),
        ],
      ),
    );
  }

  _buildLeftSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(10, (index) {
        if (index.isEven) {
          return ProductWidget();
        }

        return Container(
          height: 0,
          width: 0,
        );
      }),
    );
  }

  _buildRightSide() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(10, (index) {
          if (index.isOdd) {
            return ProductWidget();
          }

          return Container(
            height: 0,
            width: 0,
          );
        })
          ..insert(
              0,
              SizedBox(
                height: 50,
              )),
      ),
    );
  }
}
