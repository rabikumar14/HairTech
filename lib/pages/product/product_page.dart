
import 'package:Beautech/global/breakpoints.dart';
import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/pages/page_export.dart';
import 'package:Beautech/pages/product/product_export.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with WidgetsBindingObserver {
  int columnNeeded = 2;
  List<Widget> columnWidgets = [];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void didChangeMetrics() {
    super.didChangeMetrics();
    setState(() {
      columnWidgets = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);
    columnNeeded = isDisplayDesktop(context) == true
        ? ((MediaQuery.of(context).size.width - 300) ~/ 150).toInt()
        : 2;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: GlobalAppBar('Our Products', action: [

      ]),
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
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: columnNeeded,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemBuilder: (BuildContext context, int index) {
                            return ProductTile(
                              product: products[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  GridViewProducts(
                    products: products,
                    category: "Shampoo",
                    columnNeeded: columnNeeded,
                  ),
                  GridViewProducts(
                      products: products,
                      category: "Dye",
                      columnNeeded: columnNeeded),
                  GridViewProducts(
                      products: products,
                      category: "Conditioner",
                      columnNeeded: columnNeeded),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridViewProducts extends StatefulWidget {
  final String category;
  final int columnNeeded;
  GridViewProducts({
    Key key,
    @required this.products,
    this.category,
    this.columnNeeded,
  }) : super(key: key);

  final List<Product> products;

  @override
  _GridViewProductsState createState() => _GridViewProductsState();
}

class _GridViewProductsState extends State<GridViewProducts> {
  int lengthOfCategoryProduct = 0;

  List<Product> productsFilter = [];

  @override
  Widget build(BuildContext context) {
    if (productsFilter.length == 0) {
      widget.products.forEach((element) {
        if (element.productCategory == widget.category) {
          productsFilter.add(element);
        }
      });
    }
    print(lengthOfCategoryProduct);
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: productsFilter.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              return ProductTile(
                product: productsFilter[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
