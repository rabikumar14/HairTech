import 'dart:io';

import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:Beautech/services/uploadImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductEditData extends StatefulWidget {
  final Product product;

  const ProductEditData({Key key, this.product}) : super(key: key);
  @override
  _ProductEditDataState createState() => _ProductEditDataState();
}

class _ProductEditDataState extends State<ProductEditData> {
  final formKey = GlobalKey<FormState>();
  TextEditingController productNameController = new TextEditingController();
  TextEditingController productPriceController = new TextEditingController();
  TextEditingController productDescriptionController =
      new TextEditingController();
  String productCategoryDropdownValue;

  String hintText;
  String labelText;
  IconData icon;




  File _image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (productCategoryDropdownValue == null)
      productCategoryDropdownValue = widget.product.productCategory;

    return Form(
      key: formKey,
      child: Scaffold(
          appBar: GlobalAppBar(
            "Edit Product",
            color: Colors.white,
            elevation: 5,
            action: [
              IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () async {
                    if (formKey.currentState.validate()) {

                       String img  ;

                      if(_image != null)
                      {
                      img  =  await uploadNewImage(_image.path);
                      }
                          
                      var updatedProduct = Product(
                          productImg: _image == null ? widget.product.productImg : img,
                          qty: 1,
                          productStock: 100,
                          
                          documentId: widget.product.documentId,
                          productCategory: productCategoryDropdownValue,
                          productName: productNameController.text,
                          productPrice:
                              double.parse(productPriceController.text),
                          productDescription:
                              productDescriptionController.text);
                      await CRUD()
                          .editProduct(widget.product, updatedProduct)
                          .then((value) => Navigator.of(context).pop());
                    }
                  })
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
                          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: new BoxConstraints(
                      minWidth: 300,
                      maxWidth: 600,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: 350,
                              height: 300,
                              child: _image == null ? Image.network(widget.product.productImg) : Image.file(_image),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                getImageFromGallery();
                              },
                              child: Text(
                                "Change Product Image",
                                style: GoogleFonts.varelaRound(color: Colors.pink[500]),
                              ),
                            ),
                            TextFormField(
                              controller: productNameController
                                ..text = widget.product.productName,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'You cannot leave this field empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.pink[500],
                                suffixIcon: Icon(Icons.tab_outlined),
                                hintText: "Le Shampoo",
                                labelText: "Product Name",
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  child: TextFormField(
                                    controller: productPriceController
                                      ..text = widget.product.productPrice.toString(),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'You cannot leave this field empty';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      focusColor: Colors.pink[500],
                                      suffixIcon: Icon(Icons.money),
                                      hintText: "25.00",
                                      labelText: "Product Price",
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    child: DropdownButton<String>(
                                      value: productCategoryDropdownValue,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: TextStyle(color: Colors.black),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.black,
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          productCategoryDropdownValue = newValue;
                                        });
                                      },
                                      items: <String>[
                                        "Conditioner",
                                        "Shampoo",
                                        "Dye",
                                        "Hair Treatment",
                                        "Nail Polish",
                                        "Massage Oils"
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: productDescriptionController
                                ..text = widget.product.productDescription.toString(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'You cannot leave this field empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              maxLength: 200,
                              maxLines: 3,
                              decoration: InputDecoration(
                                focusColor: Colors.pink[500],
                                alignLabelWithHint: true,
                                hintText: "For smooth and silky hair",
                                labelText: "Product Description",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
