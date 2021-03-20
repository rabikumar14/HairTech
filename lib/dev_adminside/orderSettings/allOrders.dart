// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:hair_salon/dev_adminside/orderSettings/orderWidgetAdmin.dart';
// import 'package:hair_salon/models/order.dart';
// import 'package:provider/provider.dart';


// class AllOrderList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final orders = Provider.of<List<ProductOrder>>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('All Orders'),
//       ),
//       body: ListView.builder(
//           itemCount: orders.length,
//           itemBuilder: (BuildContext context, int index) {
//             return DisplayAdminHistory(
//               data: orders[index],
//             );
//           }),
//     );
//   }
// }
