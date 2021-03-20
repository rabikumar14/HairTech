import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/models/category.dart';


class EditButtonCategory extends StatefulWidget {
  const EditButtonCategory({Key key, this.width, this.categories})
      : super(key: key);

  final ProductCategory categories;

  @override
  _EditButtonCategoryState createState() => _EditButtonCategoryState(width);
  final double width;
}

class _EditButtonCategoryState extends State<EditButtonCategory> {
  final double width;

  _EditButtonCategoryState(this.width);

  TextEditingController _categoryDescriptionTextController =
      TextEditingController();
  TextEditingController _categoryNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (_categoryDescriptionTextController.text == '' ||
        _categoryDescriptionTextController.text ==
            widget.categories.categoryDescription ||
        _categoryNameTextController.text == '' ||
        _categoryNameTextController.text ==
            widget.categories.categoryDescription) {
      _categoryDescriptionTextController.text =
          widget.categories.categoryDescription;
      _categoryNameTextController.text = widget.categories.categoryName;
    }
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
                      .doc(widget.categories.categoryDocumentId)
                      .update(data)
                      .then((value) {});

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
