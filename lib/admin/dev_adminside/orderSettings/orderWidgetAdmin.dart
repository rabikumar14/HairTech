// import 'package:flutter/material.dart';
// import 'package:saludsingapore/Admin/orderSettings/orderAdminDetails.dart';
// import 'package:saludsingapore/Models/models.dart';

// List<String> test = ['Vodka x1', 'Three Mixes x4'];

// class DisplayAdminHistory extends StatelessWidget {
//   const DisplayAdminHistory({
//     Key key,
//     this.data,
//   }) : super(key: key);

//   final Order data;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (BuildContext context) {
//               return DisplayOrderDetailsAdmin(
//                 data: data,
//               );
//             },
//           ),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
//         child: Card(
//           elevation: 2,
//           color: Colors.white,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0, top: 8.0),
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           left: 8.0, bottom: 4.0, top: 8.0),
//                       child: Text(
//                         '#',
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).accentColor,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                         padding: const EdgeInsets.only(bottom: 4.0, top: 8.0),
//                         child: Text(
//                           data.orderId,
//                           style: TextStyle(
//                             fontSize: 10,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).accentColor,
//                           ),
//                         )),
//                     Spacer(),
//                     Card(
//                         color: Colors.green,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(6.0),
//                           child: Text(data.status,
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black,
//                               )),
//                         ))
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
//                       child: Text('Address: ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).accentColor,
//                           )),
//                     ),
//                     Expanded(
//                       child: Padding(
//                           padding: const EdgeInsets.only(bottom: 8.0),
//                           child: Text(data.address,
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black,
//                               ))),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
//                       child: Text(
//                         'Date: ',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).accentColor),
//                       ),
//                     ),
//                     Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text(data.orderDate.toString(),
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black,
//                             ))),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Divider(
//                   thickness: 0.2,
//                   color: Colors.black,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
//                       child: Text(
//                         'Expected Date: ',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).accentColor),
//                       ),
//                     ),
//                     Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text(data.expectedDelivery,
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black,
//                             ))),
//                     Spacer(),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
//                       child: Text(
//                         'Total: ',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).accentColor),
//                       ),
//                     ),
//                     Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text('\$' + data.orderTotal.toString(),
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black,
//                             ))),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
