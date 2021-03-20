import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/dev_adminside/categorySettings/addCategory.dart';
import 'package:hair_salon/dev_adminside/categorySettings/editCategory.dart';
import 'package:hair_salon/dev_adminside/post.dart';
import 'package:hair_salon/models/category.dart';
import 'package:provider/provider.dart';

class AllCategories extends StatefulWidget {
  final List<Post> searchList;

  const AllCategories({Key key, this.searchList}) : super(key: key);

  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<List<ProductCategory>>(context);
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
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddButtonCategory(
                              width: 200,
                            )),
                  );
                },
                child: Text("Add Category"),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SafeArea(
              child: Container(
                height: 900,
                child: SearchBar<Post>(
                  hintText: "Landing.Search here!!",
                  minimumChars: 1,
                  searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
                  headerPadding: EdgeInsets.symmetric(horizontal: 10),
                  listPadding: EdgeInsets.symmetric(horizontal: 10),
                  onSearch: _getALlPosts,
                  searchBarController: _searchBarController,
                  placeHolder: ListView(
                    children: [
                      for (var data in category)
                        ListTile(
                          key: Key(data.categoryName),
                          title: Text(data.categoryName),
                          subtitle: Text(data.categoryDocumentId),
                          leading: Icon(Icons.drag_handle),
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
                                              EditButtonCategory(
                                                categories: data,
                                                width: 200,
                                              )),
                                    );
                                  }),
                              IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection("categories")
                                        .doc(data.categoryDocumentId)
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
                    for (var data in category) {
                      if (post.title == data.categoryName) {
                        return ListTile(
                          key: Key(data.categoryName),
                          title: Text(data.categoryName),
                          subtitle: Text(data.categoryDocumentId),
                          leading: Icon(Icons.drag_handle),
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
                                              EditButtonCategory(
                                                categories: data,
                                                width: 200,
                                              )),
                                    );
                                  }),
                              IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection("categories")
                                        .doc(data.categoryDocumentId)
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
      ),
    );
  }
}
