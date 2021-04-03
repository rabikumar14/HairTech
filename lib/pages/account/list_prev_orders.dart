import 'package:Beautech/global/package_export.dart';
import 'package:Beautech/global/widget_export.dart';
import 'package:Beautech/models/appointment.dart';
import 'package:Beautech/models/order.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/models/user.dart';
import 'package:Beautech/pages/account/widget/previous_apponintmens.dart';
import 'package:Beautech/pages/account/widget/previous_order.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListOrders extends StatefulWidget {
  final AppUser appUser;

  ListOrders({Key key, this.appUser}) : super(key: key);
  @override
  _ListOrdersState createState() => _ListOrdersState();
}

class _ListOrdersState extends State<ListOrders> {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<ProductOrder>>(context);
    return Scaffold(
      appBar: GlobalAppBar("Your orders",elevation: 4),
      body: 
      
      
     orders.length > 0 ? ListView.builder(
          shrinkWrap: true,
          itemCount: orders.length,
          itemBuilder: (BuildContext context, int index) {
            ProductOrder listViewOrder = orders[index];
            if (listViewOrder.userId == widget.appUser.appUserID) {
              return OrderWidget(
                order: listViewOrder,
              );
            } else {
            return  Container();
            }
          }) : Center(
            child: Text(
              'No purchases yet!',
              style: GoogleFonts.varelaRound(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
            ),
          ),
    );
  }
}
