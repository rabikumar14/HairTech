import 'package:hair_salon/global_items/package_export.dart';
import 'package:hair_salon/global_items/widget_export.dart';
import 'package:hair_salon/pages/cart/cart_page.dart';
import 'package:hair_salon/pages/product/widget/product_tile.dart';


class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: GlobalAppBar('',
          action: AppBarAction(
            Icons.shopping_cart,
            route: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartPage()));
            },
          )),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            TabBar(
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              labelStyle: customFont,
              isScrollable: true,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
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
