import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:flutter/material.dart';

class AddNewProduct extends StatefulWidget {
  final Product product;

  const AddNewProduct({Key key, this.product}) : super(key: key);
  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final formKey = GlobalKey<FormState>();
  TextEditingController productNameController = new TextEditingController();
  TextEditingController productPriceController = new TextEditingController();
  TextEditingController productDescriptionController =
      new TextEditingController();
  String productCategoryDropdownValue;

  String hintText;
  String labelText;
  IconData icon;

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      child: Scaffold(
          appBar: GlobalAppBar(
            "Add Product",
            color: Colors.white,
            elevation: 5,
            action: [
              IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
                      var updatedProduct = Product(
                          
                          qty: 1,
                          productStock: 100,
                        
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
                            child: Image.network(widget.product.productImg),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "Change Product Image",
                              style: GoogleFonts.varelaRound(color: Colors.pink[500]),
                            ),
                          ),
                          TextFormField(
                            controller: productNameController
                             ,
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
                                  ,
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
                            ,
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
          )),
    );
  }
}
