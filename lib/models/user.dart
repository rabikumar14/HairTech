import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:hair_salon/models/product.dart';

class AppUser extends Model {
  final String appUserID;
  final String appUserEmail;
  final String appUserProfilePic;
  final String appUserPhoneNumber;
  final String appUserName;
  final String appUserAddress;
  final String appUserStripeID;
  final bool isSeller;
  final bool isDev;
  final DateTime userCreatedAt;
  final DateTime lastLogin;
  final List<Map> appUserOtherInfo;
  final List<Map> appUserSellerInfo;
  final List<Map> appUserDevInfo;
   
  double totalCartValue = 0;
  int get total => cart.length;
  List<Product> cart = [];
  AppUser({
     this.appUserID,
     this.appUserEmail,
     this.appUserProfilePic,
     this.appUserPhoneNumber,
     this.appUserName,
     this.appUserAddress,
     this.appUserStripeID,
     this.isSeller,
     this.isDev,
     this.userCreatedAt,
     this.lastLogin,
     this.appUserOtherInfo,
     this.appUserSellerInfo,
     this.appUserDevInfo,
  });


  Map<String, dynamic> toMap() {
    return {
      'appUserID': appUserID,
      'appUserEmail': appUserEmail,
      'appUserProfilePic': appUserProfilePic,
      'appUserPhoneNumber': appUserPhoneNumber,
      'appUserName': appUserName,
      'appUserAddress': appUserAddress,
      'appUserStripeID': appUserStripeID,
      'isSeller': isSeller,
      'isDev': isDev,
      'userCreatedAt': userCreatedAt.millisecondsSinceEpoch,
      'lastLogin': lastLogin.millisecondsSinceEpoch,
      'appUserOtherInfo': appUserOtherInfo,
      'appUserSellerInfo': appUserSellerInfo,
      'appUserDevInfo': appUserDevInfo,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      appUserID: map['appUserID'],
      appUserEmail: map['appUserEmail'],
      appUserProfilePic: map['appUserProfilePic'],
      appUserPhoneNumber: map['appUserPhoneNumber'],
      appUserName: map['appUserName'],
      appUserAddress: map['appUserAddress'],
      appUserStripeID: map['appUserStripeID'],
      isSeller: map['isSeller'],
      isDev: map['isDev'],
      userCreatedAt: DateTime.fromMillisecondsSinceEpoch(map['userCreatedAt']),
      lastLogin: DateTime.fromMillisecondsSinceEpoch(map['lastLogin']),
      appUserOtherInfo: List<Map>.from(map['appUserOtherInfo']?.map((x) => x)),
      appUserSellerInfo: List<Map>.from(map['appUserSellerInfo']?.map((x) => x)),
      appUserDevInfo: List<Map>.from(map['appUserDevInfo']?.map((x) => x)),
    );
  }


  @override
  String toString() {
    return 'AppUser(appUserID: $appUserID, appUserEmail: $appUserEmail, appUserProfilePic: $appUserProfilePic, appUserPhoneNumber: $appUserPhoneNumber, appUserName: $appUserName, appUserAddress: $appUserAddress, appUserStripeID: $appUserStripeID, isSeller: $isSeller, isDev: $isDev, userCreatedAt: $userCreatedAt, lastLogin: $lastLogin, appUserOtherInfo: $appUserOtherInfo, appUserSellerInfo: $appUserSellerInfo, appUserDevInfo: $appUserDevInfo)';
  }



  void addProduct(product) {
    int index = cart.indexWhere((i) => i.productName == product.productName);
    print(index);
    if (index != -1)
      updateProduct(product, product.qty + 1);
    else {
      cart.add(product);
      calculateTotal();
      notifyListeners();
    }
  }

  void removeProduct(product) {
    int index = cart.indexWhere((i) => i.productName == product.productName);
    cart[index].qty = 1;
    cart.removeWhere((item) => item.productName == product.productName);
    calculateTotal();
    notifyListeners();
  }

  void updateProduct(product, qty) {
    int index = cart.indexWhere((i) => i.productName == product.productName);
    cart[index].qty = qty;
    if (cart[index].qty == 0) removeProduct(product);

    calculateTotal();
    notifyListeners();
  }

  void clearCart() {
    cart.forEach((f) => f.qty = 1);
    cart = [];
    notifyListeners();
  }

  void calculateTotal() {
    totalCartValue = 0;
    cart.forEach((f) {
      totalCartValue +=
          double.parse((f.productPrice * f.qty).toStringAsFixed(2));
    });
  }

 
}
