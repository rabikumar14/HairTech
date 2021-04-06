import 'package:Beautech/admin/dev_adminside/add_product.dart';
import 'package:Beautech/admin/dev_adminside/product_edit_data.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/models/salon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class ProductDataTable extends StatefulWidget {
  @override
  _ProductDataTableState createState() => _ProductDataTableState();
}

class _ProductDataTableState extends State<ProductDataTable> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Scrollbar(
            isAlwaysShown: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: TextButton.icon(
                      label: Text(
                        'Add New Product',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddNewProduct()));
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Name',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Category',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Price',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Description',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Edit Product',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                        ],
                        rows: products
                            .map((element) => DataRow(cells: [
                                  DataCell(Text(element.productName)),
                                  DataCell(
                                    Text(element.productCategory),
                                  ),
                                  DataCell(
                                    Text(element.productPrice.toString()),
                                  ),
                                  DataCell(
                                    Container(
                                        width: 150,
                                        child: Text(
                                          element.productDescription,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ),
                                  DataCell(IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductEditData(
                                                        product: element)));
                                      })),
                                ]))
                            .toList()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
