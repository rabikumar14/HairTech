import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:hair_salon/models/product.dart';
import 'package:hair_salon/models/salon.dart';

class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
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
        outletOpenDays: [
          "Monday",
          "Tuesday",
          "Wednesday",
          "Thursday",
          "Friday",
          "Saturday"
        ]));
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
          productImg: faker.image.image(keywords: [keywords[random.integer(keywords.length, min: 0)]]),
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
