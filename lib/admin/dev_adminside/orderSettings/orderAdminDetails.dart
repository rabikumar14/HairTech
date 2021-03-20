// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hair_salon/varuns/database_service.dart';
// import 'package:provider/provider.dart';

// import 'package:smart_select/smart_select.dart';

// List<String> test = ['Vodka x1', 'Three Mixes x4'];

// class DisplayOrderDetailsAdmin extends StatefulWidget {
//   const DisplayOrderDetailsAdmin({
//     Key key,
//     this.data,
//   }) : super(key: key);

//   final Order data;

//   @override
//   _DisplayOrderDetailsAdminState createState() =>
//       _DisplayOrderDetailsAdminState();
// }

// class _DisplayOrderDetailsAdminState extends State<DisplayOrderDetailsAdmin> {
//   String tempValue = '';
//   final _formKey = GlobalKey<FormState>();
//   String status = '';

//   @override
//   Widget build(BuildContext context) {
//     final orderCollection = Provider.of<OrderCollection>(context);
//     List<S2Choice<String>> orderStatus = [
//       S2Choice<String>(value: 'Active', title: 'Active'),
//       S2Choice<String>(value: 'reachingToday', title: 'reachingToday'),
//       S2Choice<String>(value: 'onDelivery', title: 'onDelivery'),
//       S2Choice<String>(value: 'Completed', title: 'Completed'),
//     ];

//     if (status == "" || status == widget.data.status) {
//       status = widget.data.status;
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//             child: Card(
//               elevation: 2,
//               color: Colors.white,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(2)),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0, top: 8.0),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 8.0, bottom: 4.0, top: 8.0),
//                           child: Text(
//                             '#',
//                             style: TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.bold,
//                               color: Theme.of(context).accentColor,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                             padding:
//                             const EdgeInsets.only(bottom: 4.0, top: 8.0),
//                             child: Text(
//                               widget.data.orderId,
//                               style: TextStyle(
//                                 fontSize: 10,
//                                 fontWeight: FontWeight.bold,
//                                 color: Theme.of(context).accentColor,
//                               ),
//                             )),
//                         Spacer(),
//                         Card(
//                             color: Colors.green,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Padding(
//                               padding: const EdgeInsets.all(6.0),
//                               child: Text(status,
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black,
//                                   )),
//                             ))
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding:
//                           const EdgeInsets.only(left: 8.0, bottom: 8.0),
//                           child: Text('Address: ',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Theme.of(context).accentColor,
//                               )),
//                         ),
//                         Expanded(
//                           child: Padding(
//                               padding: const EdgeInsets.only(bottom: 8.0),
//                               child: Text(widget.data.address,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black,
//                                   ))),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding:
//                           const EdgeInsets.only(left: 8.0, bottom: 8.0),
//                           child: Text(
//                             'Date: ',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Theme.of(context).accentColor),
//                           ),
//                         ),
//                         Padding(
//                             padding: const EdgeInsets.only(bottom: 8.0),
//                             child: Text(widget.data.orderDate.toString(),
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black,
//                                 ))),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding:
//                           const EdgeInsets.only(left: 8.0, bottom: 8.0),
//                           child: Text(
//                             'Payment Method: ',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Theme.of(context).accentColor),
//                           ),
//                         ),
//                         Padding(
//                             padding: const EdgeInsets.only(bottom: 8.0),
//                             child: Text(widget.data.paymentMethod,
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black,
//                                 ))),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding:
//                           const EdgeInsets.only(left: 8.0, bottom: 8.0),
//                           child: Text(
//                             'Expected Date: ',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Theme
//                                     .of(context)
//                                     .accentColor),
//                           ),
//                         ),
//                         Padding(
//                             padding: const EdgeInsets.only(bottom: 8.0),
//                             child: Text(widget.data.expectedDelivery,
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black,
//                                 ))),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding:
//                           const EdgeInsets.only(left: 8.0, bottom: 4.0),
//                           child: Text(
//                             'Items:',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Theme.of(context).accentColor,
//                             ),
//                           ),
//                         ),
//                         ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: widget.data.itemsOrdered.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               return new Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 14, vertical: 4),
//                                     child: Row(
//                                       children: [
//                                         Text(widget.data.itemsOrdered[index]
//                                             .substring(
//                                             0,
//                                             widget.data.itemsOrdered[index]
//                                                 .lastIndexOf(' '))),
//                                         Spacer(),
//                                         Text(widget.data.itemsOrdered[index]
//                                             .substring(widget
//                                             .data.itemsOrdered[index]
//                                             .lastIndexOf(' ')))
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             }),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: Divider(
//                       thickness: 0.2,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 8.0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Padding(
//                           padding:
//                           const EdgeInsets.only(left: 8.0, bottom: 8.0),
//                           child: Text(
//                             'Total: ',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Theme.of(context).accentColor),
//                           ),
//                         ),
//                         Padding(
//                             padding: const EdgeInsets.only(bottom: 8.0),
//                             child:
//                             Text('\$' + widget.data.orderTotal.toString(),
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black,
//                                 ))),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: SmartSelect<String>.single(
//               title: 'Change Order Status',
//               value: tempValue,
//               choiceItems: orderStatus,
//               modalType: S2ModalType.bottomSheet,
//               choiceType: S2ChoiceType.chips,
//               choiceStyle: S2ChoiceStyle(
//                 showCheckmark: true,
//               ),
//               onChange: (state) => setState(() => tempValue = state.value),
//               tileBuilder: (context, state) => S2Tile.fromState(
//                 state,
//                 isTwoLine: true,
//                 leading: Container(
//                   width: 40,
//                   alignment: Alignment.center,
//                   child: const Icon(Icons.label_outline),
//                 ),
//               ),
//             ),
//           ),
//           Builder(builder: (BuildContext context) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   FlatButton(
//                       color: Colors.red,
//                       onPressed: () async {
//                         if (widget.data.status == "Active") {
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return cancelOrder(context);
//                               });
//                         } else if (widget.data.status == "Cancelled") {
//                           Scaffold.of(context).showSnackBar(SnackBar(
//                             content: Text('Order is already canceled'),
//                           ));
//                         } else {
//                           Scaffold.of(context).showSnackBar(SnackBar(
//                             content: Text('It is to late to cancel the order'),
//                           ));
//                         }
//                       },
//                       child: Text(
//                         "Cancel Order",
//                         style: TextStyle(color: Colors.white),
//                       )),
//                 ],
//               ),
//             );
//           }),
//           Builder(
//             builder: (BuildContext context) {
//               return FlatButton(
//                 color: Theme
//                     .of(context)
//                     .accentColor,
//                 onPressed: () {
//                   if (status == "Cancelled") {
//                     Scaffold.of(context).showSnackBar(SnackBar(
//                       content: Text(
//                           'You cannot change order status as it is cancelled'),
//                     ));
//                   } else if (tempValue != '') {
//                     orderCollection.collection.doc(widget.data.orderId).update(
//                       {'status': tempValue},
//                     );
//                     sendOrderEmail(
//                         widget.data.itemsOrdered.toString(),
//                         widget.data.orderId,
//                         "",
//                         tempValue,
//                         "",
//                         "Saludmart: Update on order " + widget.data.orderId,
//                         widget.data.userEmail);
//                     setState(() {
//                       status = tempValue;
//                     });
//                     Scaffold.of(context).showSnackBar(SnackBar(
//                       content: Text('Order Updated'),
//                     ));
//                   } else {
//                     Scaffold.of(context).showSnackBar(SnackBar(
//                       content: Text('Please Select an Order Status'),
//                     ));
//                   }
//                 },
//                 child: Text(
//                   'Confirm Change',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               );
//             },
//           ),
//           TextFormField()
//         ],
//       ),
//     );
//   }

//   Widget cancelOrder(BuildContext context) {
//     TextEditingController _cancelEditingController = TextEditingController();

//     return AlertDialog(
//       content: Container(
//         width: displayWidth(context) < 600 ? displayWidth(context) : 600,
//         child: Stack(
//           overflow: Overflow.visible,
//           children: <Widget>[
//             Form(
//               key: _formKey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Row(
//                       children: [
//                         Text(
//                           "Cancel Confirmation",
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.grey[700],
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Spacer(),
//                         IconButton(
//                             icon: Icon(
//                               Icons.close,
//                               color: Colors.grey[700],
//                             ),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             })
//                       ],
//                     ),
//                     Divider(
//                       thickness: 0.2,
//                       color: Colors.black,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     TextFormField(
//                       maxLines: 5,
//                       validator: (value) =>
//                       value.isEmpty
//                           ? 'Please give reason for canceling'
//                           : null,
//                       controller: _cancelEditingController,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Out of stock, unable to deliver',
//                         labelText: 'Reason for cancellation',
//                       ),
//                     ),
//                     Builder(builder: (BuildContext context) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: RaisedButton(
//                           color: Colors.black,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 30),
//                             child: Text(
//                               "Confirm",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                           onPressed: () async {
//                             if (_formKey.currentState.validate()) {
//                               if (widget.data.paymentMethod == "Card") {
//                                 showProgressDialog(context);
//                                 final NetworkService networkService =
//                                 locator.get();
//                                 final response = await networkService
//                                     .getPaymentData(widget.data.paymentIntent);

//                                 final HttpsCallable callable =
//                                 CloudFunctions.instance.getHttpsCallable(
//                                   functionName: "refundOrder",
//                                 );
//                                 final refund = await callable.call(
//                                   <String, dynamic>{
//                                     'charge': response.paymentIntent,
//                                   },
//                                 );

//                                 FirebaseFirestore.instance
//                                     .collection("order")
//                                     .doc(widget.data.orderId)
//                                     .update(
//                                   {'status': "Cancelled"},
//                                 );
//                                 sendOrderEmail(
//                                     widget.data.itemsOrdered.toString(),
//                                     widget.data.orderId,
//                                     "You shall receive the refund in 7-14 working days",
//                                     widget.data.status,
//                                     "Reason for cancelling: " +
//                                         _cancelEditingController.text,
//                                     "Saludmart: Update on order " +
//                                         widget.data.orderId,
//                                     widget.data.userEmail);
//                                 setState(() {
//                                   status = "Cancelled";
//                                 });
//                                 hideProgressDialog(context);
//                                 Navigator.pop(context);
//                               } else {
//                                 FirebaseFirestore.instance
//                                     .collection("order")
//                                     .doc(widget.data.orderId)
//                                     .update(
//                                   {'status': "Cancelled"},
//                                 );
//                                 sendOrderEmail(
//                                     widget.data.itemsOrdered.toString(),
//                                     widget.data.orderId,
//                                     "",
//                                     "Cancelled",
//                                     "Reason for cancelling: " +
//                                         _cancelEditingController.text,
//                                     "Saludmart: Update on order " +
//                                         widget.data.orderId,
//                                     widget.data.userEmail);
//                                 setState(() {
//                                   status = "Cancelled";
//                                 });
//                                 Navigator.pop(context);
//                               }
//                             }
//                           },
//                         ),
//                       );
//                     })
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
