import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/models/category.dart';


class AddButtonCategory extends StatefulWidget {
  const AddButtonCategory({Key key, this.width}) : super(key: key);

  @override
  _AddButtonCategoryState createState() => _AddButtonCategoryState(width);
  final double width;
}

class _AddButtonCategoryState extends State<AddButtonCategory> {
  final double width;

  _AddButtonCategoryState(this.width);

  @override
  Widget build(BuildContext context) {
    TextEditingController _categoryDescriptionTextController =
        TextEditingController();
    TextEditingController _categoryNameTextController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Please enter a Category name' : null,
                    controller: _categoryNameTextController,
                    decoration: InputDecoration(
                      hintText: 'Drinks',
                      labelText: 'Category Name',
                    ),
                  ),
                  TextFormField(
                    validator: (value) => value.isEmpty
                        ? 'Please enter a category description'
                        : null,
                    controller: _categoryDescriptionTextController,
                    decoration: InputDecoration(
                      hintText: "Drinks including soft drink and alcohol ",
                      labelText: 'Category Description',
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              color: Colors.black,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  final data = ProductCategory(
                    categoryName: _categoryNameTextController.text,
                    categoryDescription:
                        _categoryDescriptionTextController.text,
                  ).toMap();

                  FirebaseFirestore.instance
                      .collection("categories")
                      .add(data)
                      .then((value) {
                    print(value.id);

                    FirebaseFirestore.instance
                        .collection("categories")
                        .doc(value.id)
                        .update(
                      {'categoryDocumentId': value.documentID},
                    );
                  });

                  Navigator.of(context).pop();
                }
              },
              child: Text(
                'Insert Category',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
