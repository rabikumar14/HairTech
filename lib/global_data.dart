import 'package:Beautech/models/appointment.dart';
import 'package:Beautech/models/order.dart';
import 'package:Beautech/models/product.dart';
import 'package:Beautech/models/user.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:Beautech/services/payment_services/locator.dart';
import 'package:Beautech/services/payment_services/stripe_sdk/src/stripe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:faker/faker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'global/progress_dialog.dart';
import 'models/salon.dart';
import 'services/payment_services/network_service.dart';
import 'services/payment_services/stripe_sdk/src/ui/models.dart';

class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}

Future createAutomaticPaymentIntentProductOrder(
    BuildContext context, int cost, AppUser model, AppUser user) async {

      showProgressDialog(context);
  final HttpsCallable callable = CloudFunctions.instance
      .getHttpsCallable(functionName: 'createAutomaticPaymentIntentHandler');
  final response = await callable.call({'amount': cost});

  if (response.data["status"] == 'succeeded') {
    debugPrint('Success before authentication.');
    return;
  }
  final result = await Stripe.instance.confirmPayment(
      response.data["clientSecret"],
      paymentMethodId: 'pm_card_threeDSecure2Required');
  if (result['status'] == 'succeeded') {
    var productOrder = ProductOrder(
      helpRequest: false,
      userId: user.appUserID,
      orderDate: DateTime.now(),
      orderTotal: model.totalCartValue,
      itemsOrdered: model.cart,
      address: user.appUserAddress,
      status: "Active",
      paymentIntent: response.data["paymentIntent"],
      paymentMethod: response.data["clientSecret"],
    );

    await CRUD().addNewOrder(productOrder);
  
    hideProgressDialog(context);

    debugPrint('Success after authentication.');
    return;
  } else {
    debugPrint('Error');
  }
}


Future createAutomaticPaymentIntentAppointment(
    BuildContext context, int cost, SalonServices salonServices, String outlet,  Salon salon, User user,  DateTime appointmentTime) async {

      showProgressDialog(context);
  final HttpsCallable callable = CloudFunctions.instance
      .getHttpsCallable(functionName: 'createAutomaticPaymentIntentHandler');
  final response = await callable.call({'amount': cost});

  if (response.data["status"] == 'succeeded') {
    debugPrint('Success before authentication.');
    return;
  }
  final result = await Stripe.instance.confirmPayment(
      response.data["clientSecret"],
      paymentMethodId: 'pm_card_threeDSecure2Required');
  if (result['status'] == 'succeeded') {

    var appointmentData = Appointment(
      appointmentUserEmail: user.email,
      appointmentUserName: user.displayName,
      appointmentUserID: user.uid,
      appointmentService:salonServices.serviceName,
      appointmentSalonID: salon.salonID,
      appointmentStatus: "Active",
      appointmentSalonName: salon.salonName,
      appointmentSalonOutlet: outlet ,
      appointmentCost: salonServices.serviceCost,
      appointmentCreatedTime: DateTime.now(),
      appointmentTime: appointmentTime,
      documentLastUpdated: DateTime.now(),
      isRefund: false,
      isHelpRequestSent: false,
      payementIntent: response.data["paymentIntent"],
      paymentMethod: response.data["clientSecret"],

      

    );

    await CRUD().addNewAppointment(appointmentData);
  
    hideProgressDialog(context);

    debugPrint('Success after authentication.');
    return;
  } else {
    debugPrint('Error');
  }
}
void createAutomaticPaymentIntent(BuildContext context) async {
  final networkService = locator.get<NetworkService>();

  final response = await networkService.createAutomaticPaymentIntent(10000);

  if (response.status == 'succeeded') {
    // TODO: success
    debugPrint('Success before authentication.');
    return;
  }
  final result = await Stripe.instance.confirmPayment(response.clientSecret,
      paymentMethodId: 'pm_card_threeDSecure2Required');
  if (result['status'] == 'succeeded') {
    // TODO: success
    debugPrint('Success after authentication.');
    return;
  } else {
    debugPrint('Error');
  }
}

void fakerPackage() {
  print(faker.address.country());
  print(faker.company.name());
  print(faker.currency.code());
  print(faker.internet.email());
  print(faker.job.title());
  print(faker.person.firstName());
  print(faker.sport.name());
  print(faker.job);

  // Generate a random amount of IP v4 addresses (max 10).
  print(random.amount((_) => faker.internet.ipv4Address(), 10));

  // Generate random boolean.
  print(random.boolean());

  // Generate random decimal.
  print(random.decimal());

  // Generate random DateTime, between the years 2000 and 2020
  print(faker.date.dateTime(minYear: 2000, maxYear: 2020));

  // Generate random User Agent, with osName iOS
  print(faker.internet.userAgent(osName: 'iOS'));
}

void addSalonToFirebase() {
  List<String> salonCategory = [
    "Massage Salon",
    "Hair Salon",
    "Spa",
    "Nail Salon",
    "Beauty Salon"
  ];
  List<SalonServices> salonService = [];
  List<SalonOutlets> salonOutlet = [];

  for (int i = 0; i <= 4; i++) {
    salonOutlet.add(SalonOutlets(
        addressLineOne: faker.address.streetAddress(),
        googleMapLocationURL: faker.address.zipCode(),
        outletOpenTime: "9:00 AM",
        outletCloseTime: "9:00 PM",
        isOutletOpen: true,
        outletPhoneNumber: "+6585319150",
));
  }
  for (int i = 0; i <= 25; i++) {
    salonService.add(SalonServices(
        isServiceAvailable: random.boolean(),
        serviceCost:
            double.parse(random.decimal(scale: 3, min: 10).toStringAsFixed(2)),
        serviceDescription: faker.lorem.sentence(),
        serviceName: faker.food.dish()));
  }

  var salonData = Salon(
    salonID: "",
    lastUpdated: DateTime.now(),
    salonCoverImage: faker.image.image(),
    salonName: faker.company.name(),
    salonOwnerEmail: faker.internet.email(),
    salonOwner: faker.internet.userName(),
    salonCategory: salonCategory[random.integer(salonCategory.length, min: 0)],
    salonOwnerPhoneNumber: "+6585319150",
    salonServices: salonService,
    salonOutlets: salonOutlet,
  ).toMap();

  FirebaseFirestore.instance.collection("salons").add(salonData).then((value) {
    FirebaseFirestore.instance.collection("salons").doc(value.id).update(
      {'salonID': value.id},
    );
  });
}

void addProductToFirebase() {
  List<String> productCategory = [
    "Conditioner",
    "Shampoo",
    "Dye",
    "Hair Treatment",
    "Nail Polish",
    "Massage Oils"
  ];

  List<String> keywords = [
    "shampoo",
    "oils",
    "conditioner",
    "nail polish",
    "dye",
    "facemask",
    "nivia",
  ];

  var productData = Product(
          documentId: '',
          qty: 1,
          productName: faker.food.dish(),
          productDescription: faker.lorem.sentence(),
          productPrice: double.parse(
              random.decimal(scale: 5, min: 20).toStringAsFixed(2)),
          productImg: faker.image.image(
              keywords: [keywords[random.integer(keywords.length, min: 0)]]),
          productCategory:
              productCategory[random.integer(productCategory.length, min: 0)])
      .toMap();

  FirebaseFirestore.instance
      .collection("products")
      .add(productData)
      .then((value) {
    FirebaseFirestore.instance.collection("products").doc(value.id).update(
      {'documentId': value.id},
    );
  });
}
