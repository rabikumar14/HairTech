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

class AddButtonProduct extends StatefulWidget {
  const AddButtonProduct({Key key, this.width}) : super(key: key);

  @override
  _AddButtonProductState createState() => _AddButtonProductState(width);
  final double width;
}

class _AddButtonProductState extends State<AddButtonProduct> {
  final double width;

  _AddButtonProductState(this.width);

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

    List<S2Choice<String>> isBundle = [
      S2Choice<String>(value: 'True', title: 'True'),
      S2Choice<String>(value: 'False', title: 'False')
    ];
    List<S2Choice<String>> numberOfOptions = [
      S2Choice<String>(value: '0', title: '0'),
      S2Choice<String>(value: '1', title: '1'),
      S2Choice<String>(value: '2', title: '2'),
      S2Choice<String>(value: '3', title: '3'),
      S2Choice<String>(value: '4', title: '4'),
      S2Choice<String>(value: '5', title: '5'),
      S2Choice<String>(value: '6', title: '6'),
    ];
    final _formKey = GlobalKey<FormState>();

    if (choiceItems.length == 0 || int.parse(itemValue) > choiceItems.length) {
      for (int i = choiceItems.length; i < int.parse(itemValue); i++) {
        choiceItems.add([]);
      }
    }
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
              SmartSelect<String>.single(
                title: 'Is Bundle?',
                value: bundleValue,
                choiceItems: isBundle,
                onChange: (state) => setState(() => bundleValue = state.value),
                modalType: S2ModalType.bottomSheet,
                tileBuilder: (context, state) {
                  return S2Tile.fromState(
                    state,
                    isTwoLine: true,
                  );
                },
              ),
              SmartSelect<String>.single(
                title: 'Number of Choice?',
                value: itemValue,
                choiceItems: numberOfOptions,
                onChange: (state) => setState(() {
                  return itemValue = state.value;
                }),
                modalType: S2ModalType.bottomSheet,
                tileBuilder: (context, state) {
                  return S2Tile.fromState(
                    state,
                    isTwoLine: true,
                  );
                },
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: new NeverScrollableScrollPhysics(),
                  itemCount: int.parse(itemValue),
                  itemBuilder: (BuildContext context, int j) {
                    if (int.parse(itemValue) > 0) {
                      List<String> temp = List<String>.from(choiceItems[j]);

                      return SmartSelect<String>.multiple(
                        title: 'Choice ' + (j + 1).toString(),
                        value: temp,
                        choiceItems: S2Choice.listFrom<String, Map>(
                          source: tempProduct,
                          value: (index, item) => item['value'],
                          title: (index, item) => item['title'],
                          group: (index, item) => item['body'],
                        ),
                        onChange: (state) =>
                            setState(() => choiceItems[j] = state.value),
                        modalType: S2ModalType.bottomSheet,
                        modalConfirm: true,
                        modalFilter: true,
                        choiceGrouped: true,
                        tileBuilder: (context, state) {
                          return Card(
                            elevation: 3,
                            margin: const EdgeInsets.all(5),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: S2Tile.fromState(
                              state,
                              hideValue: true,
                              title: Text('Choice ' + (j + 1).toString()),
                              trailing: const Icon(Icons.add_circle_outline),
                              body: S2TileChips(
                                chipLength: state.valueObject.length,
                                chipLabelBuilder: (context, i) {
                                  return Text(state.valueObject[i].title);
                                },
                                chipOnDelete: (i) {
                                  setState(() => choiceItems[j]
                                      .remove(state.valueObject[i].value));
                                },
                                chipColor: Theme.of(context).accentColor,
                                chipBrightness: Brightness.dark,
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  }),
              Builder(builder: (BuildContext context) {
                return FlatButton(
                  color: Colors.black,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                
                    
                  
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
                              .add(data)
                              .then((value) {
                  
                            FirebaseFirestore.instance
                                .collection("products")
                                .doc(value.id)
                                .update(
                              {'documentId': value.id},
                            );
                          });

                          Navigator.of(context).pop();
                       
                      
                    }
                  },
                  child: Text(
                    'Insert Product',
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
            .child('folderName/' +
                image.path.substring(image.path.lastIndexOf('/')))
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
