import 'package:cloud_firestore/cloud_firestore.dart';

class Reviews {
  String reviewId;
  String productReviewed;
  String userReviewed;
  String reviewTitle;
  String reviewText;
  int ratingGiven;
  String dateReviewed;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Reviews({
    this.reviewId,
    this.productReviewed,
    this.userReviewed,
    this.reviewTitle,
    this.reviewText,
    this.ratingGiven,
    this.dateReviewed,
  });

  @override
  String toString() {
    return 'Reviews{reviewId: $reviewId, productReviewed: $productReviewed, userReviewed: $userReviewed, reviewTitle: $reviewTitle, reviewText: $reviewText, ratingGiven: $ratingGiven, dateReviewed: $dateReviewed}';
  }

  factory Reviews.fromDocument(DocumentSnapshot document) {
    return new Reviews(
      reviewId: document.id,
      productReviewed: document.data()['productReviewed'] as String,
      userReviewed: document.data()['userReviewed'] as String,
      reviewTitle: document.data()['reviewTitle'] as String,
      reviewText: document.data()['reviewText'] as String,
      ratingGiven: document.data()['ratingGiven'] as int,
      dateReviewed: document.data()['dateReviewed'] as String,
    );
  }

  factory Reviews.fromMap(Map<String, dynamic> map) {
    return new Reviews(
      reviewId: map['reviewId'] as String,
      productReviewed: map['productReviewed'] as String,
      userReviewed: map['userReviewed'] as String,
      reviewTitle: map['reviewTitle'] as String,
      reviewText: map['reviewText'] as String,
      ratingGiven: map['ratingGiven'] as int,
      dateReviewed: map['dateReviewed'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'reviewId': this.reviewId,
      'productReviewed': this.productReviewed,
      'userReviewed': this.userReviewed,
      'reviewTitle': this.reviewTitle,
      'reviewText': this.reviewText,
      'ratingGiven': this.ratingGiven,
      'dateReviewed': this.dateReviewed,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}

class Address {
  String unitNumber;
  String postCode;
  String addressLineOne;
  String addressLineTwo;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Address({
    this.unitNumber,
    this.postCode,
    this.addressLineOne,
    this.addressLineTwo,
  });

  @override
  String toString() {
    return 'Address{unitNumber: $unitNumber, postCode: $postCode, addressLineOne: $addressLineOne, addressLineTwo: $addressLineTwo}';
  }

  factory Address.fromMap(Map<dynamic, dynamic> map) {
    return new Address(
      unitNumber: map['unitNumber'] as String,
      postCode: map['postCode'] as String,
      addressLineOne: map['addressLineOne'] as String,
      addressLineTwo: map['addressLineTwo'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'unitNumber': this.unitNumber,
      'postCode': this.postCode,
      'addressLineOne': this.addressLineOne,
      'addressLineTwo': this.addressLineTwo,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}

class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}

class Choice {
  List<dynamic> choiceList;
  String choiceName;

  factory Choice.fromMap(Map<String, dynamic> map) {
    return new Choice(
      choiceList: map['choiceList'] as List<dynamic>,
      choiceName: map['choiceName'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'choiceList': this.choiceList,
      'choiceName': this.choiceName,
    } as Map<String, dynamic>;
  }

  //<editor-fold desc="Data Methods" defaultstate="collapsed">
  Choice({
    this.choiceList,
    this.choiceName,
  });

  @override
  String toString() {
    return 'Choice{choiceList: $choiceList}';
  }

//</editor-fold>

}

class Products {
  String productName;
  String productImg;
  String documentId;
  String productDescription;
  String productCategory;
  String isBundleItems;
  double productPrice;
  int numberOfChoice;
  int productStock;
  int qty;
  List<Map> choiceList;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Products({
    this.productName,
    this.productImg,
    this.documentId,
    this.productDescription,
    this.productCategory,
    this.isBundleItems,
    this.productPrice,
    this.numberOfChoice,
    this.productStock,
    this.qty,
    this.choiceList,
  });

  @override
  String toString() {
    return 'Products{productName: $productName, productImg: $productImg, documentId: $documentId, productDescription: $productDescription, productCategory: $productCategory, isBundleItems: $isBundleItems, productPrice: $productPrice, numberOfChoice: $numberOfChoice, productStock: $productStock, itemQuantity: $qty, choiceList: $choiceList}';
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    var choice = map['choiceList'];
    List<Map> choiceList = choice.cast<Map>();
    return new Products(
      productName: map['productName'] as String,
      productImg: map['productImg'] as String,
      documentId: map['documentId'] as String,
      productDescription: map['productDescription'] as String,
      productCategory: map['productCategory'] as String,
      isBundleItems: map['isBundleItems'] as String,
      productPrice: map['productPrice'] as double,
      numberOfChoice: map['numberOfChoice'] as int,
      productStock: map['productStock'] as int,
      qty: map['qty'] as int,
      choiceList: choiceList,
    );
  }

  factory Products.fromDocument(DocumentSnapshot document) {
    var choice = document.data()['choiceList'];
    List<Map> choiceList = choice.cast<Map>();
    return new Products(
      productName: document.data()['productName'] as String,
      productImg: document.data()['productImg'] as String,
      documentId: document.id,
      productDescription: document.data()['productDescription'] as String,
      productCategory: document.data()['productCategory'] as String,
      isBundleItems: document.data()['isBundleItems'] as String,
      productPrice: document.data()['productPrice'] as double,
      numberOfChoice: document.data()['numberOfChoice'] as int,
      productStock: document.data()['productStock'] as int,
      qty: document.data()['qty'] as int,
      choiceList: choiceList,
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
      'isBundleItems': this.isBundleItems,
      'productPrice': this.productPrice,
      'numberOfChoice': this.numberOfChoice,
      'productStock': this.productStock,
      'qty': this.qty,
      'choiceList': this.choiceList,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}

class Categories {
  String categoryName;
  String categoryDescription;
  String categoryImage;
  String categoryDocumentId;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Categories({
    this.categoryName,
    this.categoryDescription,
    this.categoryImage,
    this.categoryDocumentId,
  });

  @override
  String toString() {
    return 'Category{categoryName: $categoryName, categoryDescription: $categoryDescription, categoryImage: $categoryImage, categoryDocumentId: $categoryDocumentId}';
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return new Categories(
      categoryName: map['categoryName'] as String,
      categoryDescription: map['categoryDescription'] as String,
      categoryImage: map['categoryImage'] as String,
      categoryDocumentId: map['categoryDocumentId'] as String,
    );
  }

  factory Categories.fromDocument(DocumentSnapshot document) {
    return new Categories(
      categoryName: document.data()['categoryName'] as String,
      categoryDescription: document.data()['categoryDescription'] as String,
      categoryImage: document.data()['categoryImage'] as String,
      categoryDocumentId: document.id,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'categoryName': this.categoryName,
      'categoryDescription': this.categoryDescription,
      'categoryImage': this.categoryImage,
      'categoryDocumentId': this.categoryDocumentId,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}

class Order {
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

  Order({
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

  factory Order.fromMap(Map<String, dynamic> map) {
    return new Order(
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

  factory Order.fromDocument(DocumentSnapshot document) {
    return new Order(
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
