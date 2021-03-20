import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';



class Appointment {
  String appointmentID;
  String appointmentService;
  String appointmentSalonName;
  String appointmentSalonID;
  String appointmentSalonOutlet;
  String appointmentStatus;
  String appointmentUserID;
  String appointmentUserPhoneNumber;
  String appointmentUserName;
  String appointmentUserEmail;
  String payementIntent;
  String paymentMethod;
  String paymentCharge;
  String helpRequest;
  String cancellationReason;
  bool isHelpRequestSent;
  bool isRefund;
  int appointmentDiscount;
  double appointmentCost;
  DateTime appointmentTime;
  DateTime appointmentCreatedTime;
  DateTime documentLastUpdated;
  Appointment({
     this.appointmentID,
     this.appointmentService,
     this.appointmentSalonName,
     this.appointmentSalonID,
     this.appointmentSalonOutlet,
     this.appointmentStatus,
     this.appointmentUserID,
     this.appointmentUserPhoneNumber,
     this.appointmentUserName,
     this.appointmentUserEmail,
     this.payementIntent,
     this.paymentMethod,
     this.paymentCharge,
     this.helpRequest,
     this.cancellationReason,
     this.isHelpRequestSent,
     this.isRefund,
     this.appointmentDiscount,
     this.appointmentCost,
     this.appointmentTime,
     this.appointmentCreatedTime,
     this.documentLastUpdated,
  });


  



  Map<String, dynamic> toMap() {
    return {
      'appointmentID': appointmentID,
      'appointmentService': appointmentService,
      'appointmentSalonName': appointmentSalonName,
      'appointmentSalonID': appointmentSalonID,
      'appointmentSalonOutlet': appointmentSalonOutlet,
      'appointmentStatus': appointmentStatus,
      'appointmentUserID': appointmentUserID,
      'appointmentUserPhoneNumber': appointmentUserPhoneNumber,
      'appointmentUserName': appointmentUserName,
      'appointmentUserEmail': appointmentUserEmail,
      'payementIntent': payementIntent,
      'paymentMethod': paymentMethod,
      'paymentCharge': paymentCharge,
      'helpRequest': helpRequest,
      'cancellationReason': cancellationReason,
      'isHelpRequestSent': isHelpRequestSent,
      'isRefund': isRefund,
      'appointmentDiscount': appointmentDiscount,
      'appointmentCost': appointmentCost,
      'appointmentTime': appointmentTime.millisecondsSinceEpoch,
      'appointmentCreatedTime': appointmentCreatedTime.millisecondsSinceEpoch,
      'documentLastUpdated': documentLastUpdated.millisecondsSinceEpoch,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      appointmentID: map['appointmentID'],
      appointmentService: map['appointmentService'],
      appointmentSalonName: map['appointmentSalonName'],
      appointmentSalonID: map['appointmentSalonID'],
      appointmentSalonOutlet: map['appointmentSalonOutlet'],
      appointmentStatus: map['appointmentStatus'],
      appointmentUserID: map['appointmentUserID'],
      appointmentUserPhoneNumber: map['appointmentUserPhoneNumber'],
      appointmentUserName: map['appointmentUserName'],
      appointmentUserEmail: map['appointmentUserEmail'],
      payementIntent: map['payementIntent'],
      paymentMethod: map['paymentMethod'],
      paymentCharge: map['paymentCharge'],
      helpRequest: map['helpRequest'],
      cancellationReason: map['cancellationReason'],
      isHelpRequestSent: map['isHelpRequestSent'],
      isRefund: map['isRefund'],
      appointmentDiscount: map['appointmentDiscount'],
      appointmentCost: map['appointmentCost'],
      appointmentTime: DateTime.fromMillisecondsSinceEpoch(map['appointmentTime']),
      appointmentCreatedTime: DateTime.fromMillisecondsSinceEpoch(map['appointmentCreatedTime']),
      documentLastUpdated: DateTime.fromMillisecondsSinceEpoch(map['documentLastUpdated']),
    );
  }

factory Appointment.fromDocument(DocumentSnapshot document) {
    return Appointment(
      appointmentID: document.data()['appointmentID'],
      appointmentService: document.data()['appointmentService'],
      appointmentSalonName: document.data()['appointmentSalonName'],
      appointmentSalonID: document.data()['appointmentSalonID'],
      appointmentSalonOutlet: document.data()['appointmentSalonOutlet'],
      appointmentStatus: document.data()['appointmentStatus'],
      appointmentUserID: document.data()['appointmentUserID'],
      appointmentUserPhoneNumber: document.data()['appointmentUserPhoneNumber'],
      appointmentUserName: document.data()['appointmentUserName'],
      appointmentUserEmail: document.data()['appointmentUserEmail'],
      payementIntent: document.data()['payementIntent'],
      paymentMethod: document.data()['paymentMethod'],
      paymentCharge: document.data()['paymentCharge'],
      helpRequest: document.data()['helpRequest'],
      cancellationReason: document.data()['cancellationReason'],
      isHelpRequestSent: document.data()['isHelpRequestSent'],
      isRefund: document.data()['isRefund'],
      appointmentDiscount: document.data()['appointmentDiscount'],
      appointmentCost: document.data()['appointmentCost'],
      appointmentTime: DateTime.fromMillisecondsSinceEpoch(document.data()['appointmentTime']),
      appointmentCreatedTime: DateTime.fromMillisecondsSinceEpoch(document.data()['appointmentCreatedTime']),
      documentLastUpdated: DateTime.fromMillisecondsSinceEpoch(document.data()['documentLastUpdated']),
    );
  }


  @override
  String toString() {
    return 'Appointment(appointmentID: $appointmentID, appointmentService: $appointmentService, appointmentSalonName: $appointmentSalonName, appointmentSalonID: $appointmentSalonID, appointmentSalonOutlet: $appointmentSalonOutlet, appointmentStatus: $appointmentStatus, appointmentUserID: $appointmentUserID, appointmentUserPhoneNumber: $appointmentUserPhoneNumber, appointmentUserName: $appointmentUserName, appointmentUserEmail: $appointmentUserEmail, payementIntent: $payementIntent, paymentMethod: $paymentMethod, paymentCharge: $paymentCharge, helpRequest: $helpRequest, cancellationReason: $cancellationReason, isHelpRequestSent: $isHelpRequestSent, isRefund: $isRefund, appointmentDiscount: $appointmentDiscount, appointmentCost: $appointmentCost, appointmentTime: $appointmentTime, appointmentCreatedTime: $appointmentCreatedTime, documentLastUpdated: $documentLastUpdated)';
  }

}
