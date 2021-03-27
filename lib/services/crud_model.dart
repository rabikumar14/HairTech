import 'package:Beautech/models/appointment.dart';
import 'package:Beautech/models/order.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/models/user.dart';
import 'package:Beautech/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUD {
  Future editProduct(Product oldProduct, Product updatedProduct) async {
    await ProductCollection()
        .collection
        .doc(oldProduct.documentId)
        .update(updatedProduct.toMap());
  }

  Future addNewUser(String id, AppUser newAppUser) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .set(newAppUser.toMap(), SetOptions(merge: true));
  }

  Stream<AppUser> userData(String uid) {
    return FirebaseFirestore.instance.doc('user/$uid').snapshots().map((doc) {
      return AppUser.fromDocument(doc);
    });
  }

  Future addNewOrder(ProductOrder order) async {
    await FirebaseFirestore.instance
        .collection('orders')
        .add(order.toMap())
        .then((value) {
      FirebaseFirestore.instance.collection('orders').doc(value.id).update(
        {'orderId': value.id},
      );
    });
  }

  Future addNewAppointment(Appointment appointment) async {
    await FirebaseFirestore.instance
        .collection('appointments')
        .add(appointment.toMap())
        .then((value) {
      FirebaseFirestore.instance
          .collection('appointments')
          .doc(value.id)
          .update(
        {'appointmentID': value.id},
      );
    });
  }

  Stream<AppUser> streamAppUser(String id) {
    return FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .snapshots()
        .map((event) => AppUser.fromMap(event.data()));
  }

  Future updateAddress(String id, String address) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .set({"appUserAddress": address}, SetOptions(merge: true));
  }
}
