import 'package:flutter/material.dart';
import 'package:hair_salon/dev_adminside/categorySettings/allCategories.dart';
import 'package:hair_salon/dev_adminside/orderSettings/allOrders.dart';
import 'package:hair_salon/dev_adminside/post.dart';
import 'package:hair_salon/dev_adminside/productSettings/allProducts.dart';
import 'package:hair_salon/models/category.dart';
import 'package:hair_salon/models/product.dart';
import 'package:provider/provider.dart';

class AdminLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Center(
        //     child: Container(
        //         child: FlatButton(
        //             color: Colors.black,
        //             height: 70,
        //             minWidth: 200,
        //             onPressed: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => AllOrderList()),
        //               );
        //             },
        //             child: Text(
        //               "Orders",
        //               style: TextStyle(color: Colors.white),
        //             )))),
        SizedBox(
          height: 20,
        ),
        Builder(
          // Create an inner BuildContext so that we can refer to
          // the Theme with Theme.of().
          builder: (BuildContext context) {
            final category = Provider.of<List<ProductCategory>>(context);
            List<Post> searchList = [];
            for (var data in category) {
              searchList.add(Post(data.categoryName, data.categoryName));
            }
            return Center(
              child: Container(
                child: FlatButton(
                  color: Colors.black,
                  height: 70,
                  minWidth: 200,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllCategories(
                                searchList: searchList,
                              )),
                    );
                  },
                  child: Text(
                    "Category",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        Builder(
          // Create an inner BuildContext so that we can refer to
          // the Theme with Theme.of().
          builder: (BuildContext context) {
            final product = Provider.of<List<Product>>(context);
            List<Post> searchList = [];
            for (var data in product) {
              searchList.add(Post(data.productName, data.productCategory));
            }
            return Center(
              child: Container(
                child: FlatButton(
                  color: Colors.black,
                  height: 70,
                  minWidth: 200,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllProducts(
                                searchList: searchList,
                              )),
                    );
                  },
                  child: Text(
                    "Product",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 20,
        ),

      ],
    );
  }
}
