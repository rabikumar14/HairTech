import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/models/category.dart';
import 'package:hair_salon/models/product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'package:smart_select/smart_select.dart';

class EditButtonProduct extends StatefulWidget {
  const EditButtonProduct({Key key, this.width, this.products})
      : super(key: key);

  final Product products;

  @override
  _EditButtonProductState createState() => _EditButtonProductState(width);
  final double width;
}

class _EditButtonProductState extends State<EditButtonProduct> {
  final double width;

  _EditButtonProductState(this.width);

  TextEditingController _productImgTextController = TextEditingController();

  TextEditingController _productDescriptionTextController =
      TextEditingController();
  TextEditingController _productNameTextController = TextEditingController();
  TextEditingController _productPriceTextController = TextEditingController();
  List<Map<String, dynamic>> tempProduct = [];
  String bundleValue = '';
  List<S2Choice<String>> categoryItem = [];
  String value = '';
  String itemValue = '0';
  List<dynamic> choiceItems = [];

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<List<Product>>(context);
    final category = Provider.of<List<ProductCategory>>(context);

    if (_productNameTextController.text == '' ||
        _productNameTextController.text == widget.products.productName ||
        _productPriceTextController.text == '' ||
        _productPriceTextController.text ==
            widget.products.productPrice.toString()) {
      _productImgTextController.text = widget.products.productImg;
      _productPriceTextController.text =
          widget.products.productPrice.toString();
      _productDescriptionTextController.text =
          widget.products.productDescription;
      _productNameTextController.text = widget.products.productName;
    }
    if (value == '' || value == widget.products.productCategory) {
      value = widget.products.productCategory;
    }

    if (categoryItem.length == 0) {
      for (var data in category)
        categoryItem.add(S2Choice<String>(
            value: data.categoryName, title: data.categoryName));
    }

    if (tempProduct == null || tempProduct.length == 0) {
      for (var data in product)
        tempProduct.add({
          'value': data.productName,
          'title': data.productName,
          'brand': data.productPrice.toString(),
          'body': data.productCategory
        });
    }

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'Please enter a Product name' : null,
                      controller: _productNameTextController,
                      decoration: InputDecoration(
                        hintText: 'Vodka',
                        labelText: 'Product Name',
                      ),
                    ),
                    TextFormField(
                      validator: (value) => value.isEmpty
                          ? 'Please enter a Img url or get from phone'
                          : null,
                      controller: _productImgTextController,
                      decoration: InputDecoration(
                        hintText: 'www.image.jpg',
                        labelText: 'Product Image',
                      ),
                    ),
                    FlatButton(
                        onPressed: () {
                          uploadImage();
                        },
                        child: Text("Choose Image From Phone")),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'Please enter a product price' : null,
                      controller: _productPriceTextController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "29.99 ",
                        labelText: 'Product price',
                      ),
                    ),
                    TextFormField(
                      validator: (value) => value.isEmpty
                          ? 'Please enter a product description'
                          : null,
                      controller: _productDescriptionTextController,
                      decoration: InputDecoration(
                        hintText: "Vodka 1971",
                        labelText: 'Product Description',
                      ),
                    ),
                  ],
                ),
              ),
              SmartSelect<String>.single(
                title: 'Category',
                value: value,
                choiceItems: categoryItem,
                onChange: (state) => setState(() => value = state.value),
                modalType: S2ModalType.bottomSheet,
                tileBuilder: (context, state) {
                  return S2Tile.fromState(
                    state,
                    isTwoLine: true,
                  );
                },
              ),
       
        
              Builder(builder: (BuildContext context) {
                return FlatButton(
                  color: Colors.black,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      FirebaseFirestore.instance
                          .collection('products')
                          .document('widget.products.documentId')
                          .update({'choiceList': FieldValue.delete()});
                      final data = Product(
                        productName: _productNameTextController.text,
                        productPrice:
                            double.parse(_productPriceTextController.text),
                        productCategory: value,
                        productDescription:
                            _productDescriptionTextController.text,
                        productImg: _productImgTextController.text,
                        qty: 1,
                      ).toMap();
                      FirebaseFirestore.instance
                          .collection("products")
                          .doc(widget.products.documentId)
                          .update(data)
                          .then((value) {});

                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    'Update Category',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        //Upload to Firebase
        var snapshot = await _storage
            .ref()
            .child('folderName/imageName')
            .putFile(file)
            .whenComplete(() => null);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          _productImgTextController.text = downloadUrl;
        });
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }
}
