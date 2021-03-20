
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductOrder {
  String orderId;
  String paymentIntent;
  String paymentMethod;
  String orderDate;
  String expectedDelivery;
  String latestUpdate;
  String postage;
  String address;
  String status;
  String userId;
  bool helpRequest;
  double orderTotal;
  List<dynamic> itemsOrdered;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  ProductOrder({
    this.orderId,
    this.paymentIntent,
    this.paymentMethod,
    this.orderDate,
    this.expectedDelivery,
    this.latestUpdate,
    this.postage,
    this.address,
    this.status,
    this.userId,
    this.helpRequest,
    this.orderTotal,
    this.itemsOrdered,
  });

  @override
  String toString() {
    return 'Order{orderId: $orderId, paymentIntent: $paymentIntent, paymentMethod: $paymentMethod, orderDate: $orderDate, expectedDelivery: $expectedDelivery, latestUpdate: $latestUpdate, postage: $postage, address: $address, status: $status, userId: $userId, helpRequest: $helpRequest, orderTotal: $orderTotal, itemsOrdered: $itemsOrdered}';
  }

  factory ProductOrder.fromMap(Map<String, dynamic> map) {
    return new ProductOrder(
      orderId: map['orderId'] as String,
      paymentIntent: map['paymentIntent'] as String,
      paymentMethod: map['paymentMethod'] as String,
      orderDate: map['orderDate'] as String,
      expectedDelivery: map['expectedDelivery'] as String,
      latestUpdate: map['latestUpdate'] as String,
      postage: map['postage'] as String,
      address: map['address'] as String,
      status: map['status'] as String,
      userId: map['userId'] as String,
      helpRequest: map['helpRequest'] as bool,
      orderTotal: map['orderTotal'] as double,
      itemsOrdered: map['itemsOrdered'] as List<dynamic>,
    );
  }

  factory ProductOrder.fromDocument(DocumentSnapshot document) {
    return new ProductOrder( 
      orderId: document.id,
      paymentIntent: document.data()['paymentIntent'] as String,
      paymentMethod: document.data()['paymentMethod'] as String,
      orderDate: document.data()['orderDate'] as String,
      expectedDelivery: document.data()['expectedDelivery'] as String,
      latestUpdate: document['latestUpdate'] as String,
      postage: document.data()['postage'] as String,
      address: document.data()['address'] as String,
      status: document.data()['status'] as String,
      userId: document.data()['userId'] as String,
      helpRequest: document.data()['helpRequest'] as bool,
      orderTotal: document.data()['orderTotal'] as double,
      itemsOrdered: document.data()['itemsOrdered'] as List<dynamic>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'orderId': this.orderId,
      'paymentIntent': this.paymentIntent,
      'paymentMethod': this.paymentMethod,
      'orderDate': this.orderDate,
      'expectedDelivery': this.expectedDelivery,
      'latestUpdate': this.latestUpdate,
      'postage': this.postage,
      'address': this.address,
      'status': this.status,
      'userId': this.userId,
      'helpRequest': this.helpRequest,
      'orderTotal': this.orderTotal,
      'itemsOrdered': this.itemsOrdered,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
