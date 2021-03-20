import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String productName;
  String productImg;
  String documentId;
  String productDescription;
  String productCategory;
  double productPrice;
  int productStock;
  int qty;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Product({
    this.productName,
    this.productImg,
    this.documentId,
    this.productDescription,
    this.productCategory,
    this.productPrice,
    this.productStock,
    this.qty,
  });

  @override
  String toString() {
    return 'Products{productName: $productName, productImg: $productImg, documentId: $documentId, productDescription: $productDescription, productCategory: $productCategory, productPrice: $productPrice,  productStock: $productStock, itemQuantity: $qty, }';
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return new Product(
      productName: map['productName'] as String,
      productImg: map['productImg'] as String,
      documentId: map['documentId'] as String,
      productDescription: map['productDescription'] as String,
      productCategory: map['productCategory'] as String,
      productPrice: map['productPrice'] as double,
      productStock: map['productStock'] as int,
      qty: map['qty'] as int,
    );
  }

  factory Product.fromDocument(DocumentSnapshot document) {
    // var choice = document.data()['choiceList'];
    // List<Map> choiceList = choice.cast<Map>();
    return new Product(
      productName: document.data()['productName'] as String,
      productImg: document.data()['productImg'] as String,
      documentId: document.id,
      productDescription: document.data()['productDescription'] as String,
      productCategory: document.data()['productCategory'] as String,
      productPrice: document.data()['productPrice'] as double,
      productStock: document.data()['productStock'] as int,
      qty: document.data()['qty'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'productName': this.productName,
      'productImg': this.productImg,
      'documentId': this.documentId,
      'productDescription': this.productDescription,
      'productCategory': this.productCategory,
      'productPrice': this.productPrice,
      'productStock': this.productStock,
      'qty': this.qty,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
