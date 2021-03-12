// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:saludsingapore/Models/models.dart';
//
// void addReview(Reviews reviews) {
//   FirebaseFirestore.instance
//       .collection("reviews")
//       .add(reviews.toMap())
//       .then((value) {
//     FirebaseFirestore.instance.collection("reviews").doc(value.id).update(
//       {'reviewId': value.id},
//     );
//   });
// }
