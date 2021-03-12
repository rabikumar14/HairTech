// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:saludsingapore/Models/models.dart';
// import 'package:saludsingapore/Models/postage.dart';
//
// Stream<List<Postage>> postage() {
//   return PostageCollection().collection.snapshots().map((snapshot) {
//     return snapshot.docs.map((doc) => Postage.fromDocument(doc)).toList();
//   });
// }
//
// Stream<List<Products>> products() {
//   return ProductCollection().collection.snapshots().map((snapshot) {
//     return snapshot.docs.map((doc) => Products.fromDocument(doc)).toList();
//   });
// }
//
// Stream<List<Reviews>> reviews() {
//   return ReviewsCollection().collection.snapshots().map((snapshot) {
//     return snapshot.docs.map((doc) => Reviews.fromDocument(doc)).toList();
//   });
// }
//
// Stream<List<Categories>> categories() {
//   return CategoriesCollection().collection.snapshots().map((snapshot) {
//     return snapshot.docs.map((doc) => Categories.fromDocument(doc)).toList();
//   });
// }
//
// Stream<List<Order>> order() {
//   return OrderCollection().collection.snapshots().map((snapshot) {
//     return snapshot.docs.map((doc) => Order.fromDocument(doc)).toList();
//   });
// }
//
// class PostageCollection {
//   CollectionReference collection =
//       FirebaseFirestore.instance.collection('postage');
// }
//
// class ProductCollection {
//   CollectionReference collection =
//       FirebaseFirestore.instance.collection('products');
// }
//
// class OrderCollection {
//   CollectionReference collection =
//       FirebaseFirestore.instance.collection('order');
// }
//
// class CategoriesCollection {
//   CollectionReference collection =
//       FirebaseFirestore.instance.collection('categories');
// }
//
// class ReviewsCollection {
//   CollectionReference collection =
//       FirebaseFirestore.instance.collection('reviews');
// }
