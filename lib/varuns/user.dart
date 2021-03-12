// import 'package:saludsingapore/Models/models.dart';
// import 'package:scoped_model/scoped_model.dart';
//
// class AppUser extends Model {
//   final String displayName;
//   final String email;
//   final String address;
//   final String id;
//   final String seller;
//   final String stripeId;
//   final String dateOfBirth;
//   final String phoneNumber;
//   final List<dynamic> productRatings;
//   List<Map> orders = [];
//   List<Map> addressList = [];
//   double totalCartValue = 0;
//
//   int get total => cart.length;
//   List<Products> cart = [];
//   List<dynamic> likedProducts = [];
//
//   //<editor-fold desc="Data Methods" defaultstate="collapsed">
//
//   AppUser({
//     this.displayName,
//     this.email,
//     this.address,
//     this.id,
//     this.seller,
//     this.stripeId,
//     this.dateOfBirth,
//     this.phoneNumber,
//     this.productRatings,
//     this.likedProducts,
//     this.orders,
//     this.addressList,
//   });
//
//   @override
//   String toString() {
//     return 'AppUser{displayName: $displayName, email: $email, address: $address, id: $id, seller: $seller, stripeId: $stripeId, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, likedProducts: $likedProducts, orders: $orders}';
//   }
//
//   factory AppUser.fromMap(Map<String, dynamic> map) {
// //    var addressList = map['addressList'];
// //    List<Map> addressMap = addressList.cast<Map>();
//     return new AppUser(
//       displayName: map['displayName'] as String,
//       email: map['email'] as String,
//       address: map['address'] as String,
//       id: map['id'] as String,
//       seller: map['seller'] as String,
//       stripeId: map['stripeId'] as String,
//       dateOfBirth: map['dateOfBirth'] as String,
//       phoneNumber: map['phoneNumber'] as String,
//       productRatings: map['productRatings'] as List<dynamic>,
//       likedProducts: map['likedProducts'] as List<dynamic>,
// //      orders: addressMap,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     // ignore: unnecessary_cast
//     return {
//       'displayName': this.displayName,
//       'email': this.email,
//       'address': this.address,
//       'id': this.id,
//       'seller': this.seller,
//       'stripeId': this.stripeId,
//       'dateOfBirth': this.dateOfBirth,
//       'phoneNumber': this.phoneNumber,
//       'likedProducts': this.likedProducts,
//       'productRatings': this.productRatings,
//       'orders': this.orders,
//       'addressList': this.addressList,
//     } as Map<String, dynamic>;
//   }
//
// //  </editor-fold>
//
//   void addProduct(product) {
//     int index = cart.indexWhere((i) => i.productName == product.productName);
//     print(index);
//     if (index != -1)
//       updateProduct(product, product.qty + 1);
//     else {
//       cart.add(product);
//       calculateTotal();
//       notifyListeners();
//     }
//   }
//
//   void removeProduct(product) {
//     int index = cart.indexWhere((i) => i.productName == product.productName);
//     cart[index].qty = 1;
//     cart.removeWhere((item) => item.productName == product.productName);
//     calculateTotal();
//     notifyListeners();
//   }
//
//   void updateProduct(product, qty) {
//     int index = cart.indexWhere((i) => i.productName == product.productName);
//     cart[index].qty = qty;
//     if (cart[index].qty == 0) removeProduct(product);
//
//     calculateTotal();
//     notifyListeners();
//   }
//
//   void clearCart() {
//     cart.forEach((f) => f.qty = 1);
//     cart = [];
//     notifyListeners();
//   }
//
//   void calculateTotal() {
//     totalCartValue = 0;
//     cart.forEach((f) {
//       totalCartValue +=
//           double.parse((f.productPrice * f.qty).toStringAsFixed(2));
//     });
//   }
// }
