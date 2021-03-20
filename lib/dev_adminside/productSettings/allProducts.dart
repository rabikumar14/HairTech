import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/dev_adminside/post.dart';
import 'package:hair_salon/dev_adminside/productSettings/addProduct.dart';
import 'package:hair_salon/dev_adminside/productSettings/editProduct.dart';
import 'package:hair_salon/models/product.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatefulWidget {
  final List<Post> searchList;

  const AllProducts({Key key, this.searchList}) : super(key: key);

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<List<Product>>(context);
    final SearchBarController<Post> _searchBarController =
        SearchBarController();

    Future<List<Post>> _getALlPosts(String text) async {
      List<Post> posts = widget.searchList
          .where((element) =>
              element.title.contains(text) ||
              element.title.toLowerCase().contains(text) ||
              element.title.toUpperCase().contains(text) ||
              element.body.toLowerCase().contains(text) ||
              element.body.toLowerCase().contains(text))
          .toList();
      return posts;
    }

    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          shrinkWrap: true,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddButtonProduct(
                                width: 200,
                              )),
                    );
                  },
                  child: Text("Add Product"),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SafeArea(
                child: Container(
                  height: 600,
                  child: SearchBar<Post>(
                    hintText: "Landing.Search here!!",
                    minimumChars: 1,
                    searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
                    headerPadding: EdgeInsets.symmetric(horizontal: 10),
                    listPadding: EdgeInsets.symmetric(horizontal: 10),
                    onSearch: _getALlPosts,
                    searchBarController: _searchBarController,
                    placeHolder: ListView(
                      shrinkWrap: true,
                      children: [
                        for (var data in product)
                          ListTile(
                            key: Key(data.productName),
                            title: Text(data.productName),
                            subtitle: Text(data.documentId),
                            leading: Container(
                              height: 50,
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  data.productImg,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditButtonProduct(
                                                  width: 200,
                                                  products: data,
                                                )),
                                      );
                                    }),
                                IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection("products")
                                          .doc(data.documentId)
                                          .delete();
                                    })
                              ],
                            ),
                          ),
                      ],
                    ),

                    cancellationWidget: Text("Cancel"),
                    emptyWidget: Center(
                        child: Text(
                      "No items found",
                      style: TextStyle(fontSize: 18),
                    )),
                    onCancelled: () {
                      print("Cancelled triggered");
                    },
                    mainAxisSpacing: 10,
                    // ignore: missing_return
                    onItemFound: (Post post, int index) {
                      for (var data in product) {
                        if (post.title == data.productName) {
                          return ListTile(
                            key: Key(data.productName),
                            title: Text(data.productName),
                            subtitle: Text(data.documentId),
                            leading: Icon(Icons.drag_handle),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.edit), onPressed: () {}),
                                IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection("products")
                                          .doc(data.documentId)
                                          .delete();
                                    })
                              ],
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
