import 'package:Beautech/models/appointment.dart';
import 'package:Beautech/models/order.dart';
import 'package:Beautech/models/product.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  final ProductOrder order;

  const OrderWidget({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> productsOrdered = [];

    order.itemsOrdered.forEach((element) {
      productsOrdered.add(element.productName);
    });
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, bottom: 4.0, top: 8.0),
                  child: Text(
                    '#',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 4.0, top: 8.0),
                    child: Text(
                      order.orderId,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      ),
                    )),
                Spacer(),
                Card(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(order.status,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          )),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Text('Address: ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      )),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(order.address,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,bottom: 4
                  ),
                  child: Text('Order Date: ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      )),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(order.orderDate.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                ),
              ],
            ),
          ),

        
      
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4),
            child: Row(
              children: [
          
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                  child: Text(
                    'Total: ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('\$' + order.orderTotal.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ))),
              ],
            ),
          ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:15),
                child: Divider(
                  thickness: 0.2,
                  color: Colors.pink[500],
                ),
              ),
              ExpansionTile(
            title: Text(
              "Items Ordered",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              ListTile(
                title: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: order.itemsOrdered.length > 4
                      ? 4
                      : order.itemsOrdered.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product listViewProduct = order.itemsOrdered[index];
                    return Row(
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, bottom: 8.0),
                            child: Text(
                                "x" +
                                    listViewProduct.qty.toString() +
                                    "  " +
                                    listViewProduct.productName,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ))),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, bottom: 8.0, right: 8),
                          child: Text(
                            '\$' +
                                listViewProduct.productPrice.toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
