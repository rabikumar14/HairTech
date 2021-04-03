
import 'package:cloud_firestore/cloud_firestore.dart';

class SalonCategory {
  String salonCategoryID;
  String salonCategoryName;
  String salonCategoryDescription;
  String salonCategoryImage;
  SalonCategory({
     this.salonCategoryID,
     this.salonCategoryName,
     this.salonCategoryDescription,
     this.salonCategoryImage,
  });


  Map<String, dynamic> toMap() {
    return {
      'salonCategoryID': salonCategoryID,
      'salonCategoryName': salonCategoryName,
      'salonCategoryDescription': salonCategoryDescription,
      'salonCategoryImage': salonCategoryImage,
    };
  }

  factory SalonCategory.fromMap(Map<String, dynamic> map) {
    return SalonCategory(
      salonCategoryID: map['salonCategoryID'],
      salonCategoryName: map['salonCategoryName'],
      salonCategoryDescription: map['salonCategoryDescription'],
      salonCategoryImage: map['salonCategoryImage'],
    );
  }

  @override
  String toString() {
    return 'SalonCategory(salonCategoryID: $salonCategoryID, salonCategoryName: $salonCategoryName, salonCategoryDescription: $salonCategoryDescription, salonCategoryImage: $salonCategoryImage)';
  }
  
}

class SalonOutlets {
  String outletID;
  String unitNumber;
  String postCode;
  String addressLineOne;
  String addressLineTwo;
  String outletOpenTime;
  String outletCloseTime;
  String googleMapLocationURL;
  String outletPhoneNumber;
  bool isOutletOpen;


  SalonOutlets({
     this.outletID,
     this.unitNumber,
     this.postCode,
     this.addressLineOne,
     this.addressLineTwo,
     this.outletOpenTime,
     this.outletCloseTime,
     this.googleMapLocationURL,
     this.outletPhoneNumber,
     this.isOutletOpen,

  });

  Map<String, dynamic> toMap() {
    return {
      'outletID': outletID,
      'unitNumber': unitNumber,
      'postCode': postCode,
      'addressLineOne': addressLineOne,
      'addressLineTwo': addressLineTwo,
      'outletOpenTime': outletOpenTime,
      'outletCloseTime': outletCloseTime,
      'googleMapLocationURL': googleMapLocationURL,
      'outletPhoneNumber': outletPhoneNumber,
      'isOutletOpen': isOutletOpen,
    
    };
  }

  factory SalonOutlets.fromMap(Map<String, dynamic> map) {
    return SalonOutlets(
      outletID: map['outletID'],
      unitNumber: map['unitNumber'],
      postCode: map['postCode'],
      addressLineOne: map['addressLineOne'],
      addressLineTwo: map['addressLineTwo'],
      outletOpenTime: map['outletOpenTime'],
      outletCloseTime: map['outletCloseTime'],
      googleMapLocationURL: map['googleMapLocationURL'],
      outletPhoneNumber: map['outletPhoneNumber'],
      isOutletOpen: map['isOutletOpen'],

    );
  }

  
  @override
  String toString() {
    return 'SalonOutlets(outletID: $outletID, unitNumber: $unitNumber, postCode: $postCode, addressLineOne: $addressLineOne, addressLineTwo: $addressLineTwo, outletOpenTime: $outletOpenTime, outletCloseTime: $outletCloseTime, googleMapLocationURL: $googleMapLocationURL, outletPhoneNumber: $outletPhoneNumber, isOutletOpen: $isOutletOpen)';
  }

}

class SalonServices {
  String serviceID;
  String serviceName;
  String serviceDescription;
  double serviceCost;
  int serviceDiscounted;
  bool isServiceAvailable;  
  SalonServices({
     this.serviceID,
     this.serviceName,
     this.serviceDescription,
     this.serviceCost,
     this.serviceDiscounted,
     this.isServiceAvailable,
  });

  Map<String, dynamic> toMap() {
    return {
      'serviceID': serviceID,
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'serviceCost': serviceCost,
      'serviceDiscounted': serviceDiscounted,
      'isServiceAvailable': isServiceAvailable,
    };
  }

  factory SalonServices.fromMap(Map<String, dynamic> map) {
    return SalonServices(
      serviceID: map['serviceID'],
      serviceName: map['serviceName'],
      serviceDescription: map['serviceDescription'],
      serviceCost: map['serviceCost'],
      serviceDiscounted: map['serviceDiscounted'],
      isServiceAvailable: map['isServiceAvailable'],
    );
  }

  @override
  String toString() {
    return 'SalonServices(serviceID: $serviceID, serviceName: $serviceName, serviceDescription: $serviceDescription, serviceCost: $serviceCost, serviceDiscounted: $serviceDiscounted, isServiceAvailable: $isServiceAvailable)';
  }
}

class Salon {
  String salonID;
  String salonName;
  String salonOwner;
  String salonOwnerEmail;
  String salonOwnerPhoneNumber;
  String salonCoverImage;
  String salonCategory;
  double salonRating;
  DateTime lastUpdated;
  List<SalonServices> salonServices;
  List<SalonOutlets> salonOutlets;
  Salon({
     this.salonID,
     this.salonName,
     this.salonOwner,
     this.salonOwnerEmail,
     this.salonOwnerPhoneNumber,
     this.salonCoverImage,
     this.salonCategory,
     this.salonRating,
     this.lastUpdated,
     this.salonServices,
     this.salonOutlets,
  });

  Map<String, dynamic> toMap() {
    return {
      'salonID': salonID,
      'salonName': salonName,
      'salonOwner': salonOwner,
      'salonOwnerEmail': salonOwnerEmail,
      'salonOwnerPhoneNumber': salonOwnerPhoneNumber,
      'salonCoverImage': salonCoverImage,
      'salonCategory': salonCategory,
      'salonRating': salonRating,
      'lastUpdated': lastUpdated.millisecondsSinceEpoch,
      'salonServices': salonServices.map((x) => x.toMap()).toList(),
      'salonOutlets': salonOutlets.map((x) => x.toMap()).toList(),
    };
  }

  factory Salon.fromMap(Map<String, dynamic> map) {
    return Salon(
      salonID: map['salonID'],
      salonName: map['salonName'],
      salonOwner: map['salonOwner'],
      salonOwnerEmail: map['salonOwnerEmail'],
      salonOwnerPhoneNumber: map['salonOwnerPhoneNumber'],
      salonCoverImage: map['salonCoverImage'],
      salonCategory: map['salonCategory'],
      salonRating: map['salonRating'],
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(map['lastUpdated']),
      salonServices: List<SalonServices>.from(map['salonServices'].map((x) => SalonServices.fromMap(x))),
      salonOutlets: List<SalonOutlets>.from(map['salonOutlets'].map((x) => SalonOutlets.fromMap(x))),
    );
  }

    factory Salon.fromDocument(DocumentSnapshot document) {
    return Salon(
      salonID: document.data()['salonID'],
      salonName: document.data()['salonName'],
      salonOwner: document.data()['salonOwner'],
      salonOwnerEmail: document.data()['salonOwnerEmail'],
      salonOwnerPhoneNumber: document.data()['salonOwnerPhoneNumber'],
      salonCoverImage: document.data()['salonCoverImage'],
      salonCategory: document.data()['salonCategory'],
      salonRating: document.data()['salonRating'],
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(document.data()['lastUpdated']),
      salonServices: List<SalonServices>.from(document.data()['salonServices'].map((x) => SalonServices.fromMap(x))),
      salonOutlets: List<SalonOutlets>.from(document.data()['salonOutlets'].map((x) => SalonOutlets.fromMap(x))),
    );
  }

 
  @override
  String toString() {
    return 'Salon(salonID: $salonID, salonName: $salonName, salonOwner: $salonOwner, salonOwnerEmail: $salonOwnerEmail, salonOwnerPhoneNumber: $salonOwnerPhoneNumber, salonCoverImage: $salonCoverImage, salonCategory: $salonCategory, salonRating: $salonRating, lastUpdated: $lastUpdated, salonServices: $salonServices, salonOutlets: $salonOutlets)';
  }

  
}
