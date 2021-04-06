import 'package:Beautech/admin/dev_adminside/product_edit_data.dart';

import 'package:Beautech/models/export_models.dart';
import 'package:Beautech/models/order.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/models/salon.dart';
import 'package:Beautech/services/export_services.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ProductOrderDataTable extends StatefulWidget {
  final Salon salon;

  const ProductOrderDataTable({Key key, this.salon}) : super(key: key);
  @override
  _ProductOrderDataTableState createState() => _ProductOrderDataTableState();
}

class _ProductOrderDataTableState extends State<ProductOrderDataTable> {
  bool sort = false;
  @override
  Widget build(BuildContext context) {
    List<ProductOrder> productOrder = Provider.of<List<ProductOrder>>(context);
    List<ProductOrder> listProductOrder;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Scrollbar(
            isAlwaysShown: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DataTable(
                        sortColumnIndex: 0,
                        sortAscending: sort,
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Order Id',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Address',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Cost',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Items Ordered',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Status',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Change Status',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.pink),
                            ),
                          ),
                        ],
                        rows: productOrder
                            .map((element) => DataRow(cells: [
                                  DataCell(
                                    Text(element.orderId.toString()),
                                  ),
                                  DataCell(
                                    Text(element.address),
                                  ),
                                  DataCell(
                                    Text("\$" + element.orderTotal.toString()),
                                  ),
                                  DataCell(
                                    Container(
                                        width: 300,
                                        child: Text(
                                          element.itemsOrdered.toString(),
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ),
                                  DataCell(
                                    Text(element.status),
                                  ),
                                  DataCell(Row(
                                    children: [
                                      OutlinedButton(
                                          onPressed: () {
                                            CRUD().updateOrder(
                                                "Completed", element.orderId);
                                            setState(() {});
                                          },
                                          child: Text("Mark Completed")),
                                      SizedBox(width: 10),
                                      OutlinedButton(
                                          onPressed: () {
                                            CRUD().updateOrder(
                                                "Cancelled", element.orderId);
                                            setState(() {});
                                          },
                                          child: Text("Cancel & Refund")),
                                      SizedBox(width: 10),
                                      OutlinedButton(
                                          onPressed: () {
                                            CRUD().updateOrder(
                                                "Active", element.orderId);
                                            setState(() {});
                                          },
                                          child: Text("Mark Active"))
                                    ],
                                  )),
                                ]))
                            .toList()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
