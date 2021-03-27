import 'dart:convert';

import 'package:Beautech/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProductOrder {
  String orderId;
  String paymentIntent;
  String paymentMethod;
  DateTime orderDate;
  String expectedDelivery;
  String latestUpdate;
  String postage;
  String address;
  String status;
  String userId;
  bool helpRequest;
  double orderTotal;
  List<Product> itemsOrdered;
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

  factory ProductOrder.fromDocument(DocumentSnapshot document) {
    return new ProductOrder(
      orderId: document.id,
      paymentIntent: document.data()['paymentIntent'] as String,
      paymentMethod: document.data()['paymentMethod'] as String,
      orderDate:
          DateTime.fromMillisecondsSinceEpoch(document.data()['orderDate']),
      expectedDelivery: document.data()['expectedDelivery'] as String,
      latestUpdate: document['latestUpdate'] as String,
      postage: document.data()['postage'] as String,
      address: document.data()['address'] as String,
      status: document.data()['status'] as String,
      userId: document.data()['userId'] as String,
      helpRequest: document.data()['helpRequest'] as bool,
      orderTotal: document.data()['orderTotal'] as double,
      itemsOrdered: List<Product>.from(
          document.data()['itemsOrdered'].map((x) => Product.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'paymentIntent': paymentIntent,
      'paymentMethod': paymentMethod,
      'orderDate': orderDate.millisecondsSinceEpoch,
      'expectedDelivery': expectedDelivery,
      'latestUpdate': latestUpdate,
      'postage': postage,
      'address': address,
      'status': status,
      'userId': userId,
      'helpRequest': helpRequest,
      'orderTotal': orderTotal,
      'itemsOrdered': itemsOrdered.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductOrder.fromMap(Map<String, dynamic> map) {
    return ProductOrder(
      orderId: map['orderId'],
      paymentIntent: map['paymentIntent'],
      paymentMethod: map['paymentMethod'],
      orderDate: DateTime.fromMillisecondsSinceEpoch(map['orderDate']),
      expectedDelivery: map['expectedDelivery'],
      latestUpdate: map['latestUpdate'],
      postage: map['postage'],
      address: map['address'],
      status: map['status'],
      userId: map['userId'],
      helpRequest: map['helpRequest'],
      orderTotal: map['orderTotal'],
      itemsOrdered: List<Product>.from(
          map['itemsOrdered'].map((x) => Product.fromMap(x))),
    );
  }

  @override
  String toString() {
    return 'ProductOrder(orderId: $orderId, paymentIntent: $paymentIntent, paymentMethod: $paymentMethod, orderDate: $orderDate, expectedDelivery: $expectedDelivery, latestUpdate: $latestUpdate, postage: $postage, address: $address, status: $status, userId: $userId, helpRequest: $helpRequest, orderTotal: $orderTotal, itemsOrdered: $itemsOrdered)';
  }
}
