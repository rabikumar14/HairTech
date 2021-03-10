import 'package:cloud_firestore/cloud_firestore.dart';

class Postage {
  double postageCost;
  String postageId;
  String numberOfDays;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Postage({
    this.postageCost,
    this.postageId,
    this.numberOfDays,
  });

  Postage copyWith({
    double postageCost,
    double totalCost,
    String numberOfDays,
  }) {
    return new Postage(
      postageCost: postageCost ?? this.postageCost,
      postageId: totalCost ?? this.postageId,
      numberOfDays: numberOfDays ?? this.numberOfDays,
    );
  }

  @override
  String toString() {
    return 'Postage{postageCost: $postageCost, totalCost: $postageId, numberOfDays: $numberOfDays}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Postage &&
          runtimeType == other.runtimeType &&
          postageCost == other.postageCost &&
          postageId == other.postageId &&
          numberOfDays == other.numberOfDays);

  @override
  int get hashCode =>
      postageCost.hashCode ^ postageId.hashCode ^ numberOfDays.hashCode;

  factory Postage.fromMap(Map<String, dynamic> map) {
    return new Postage(
      postageCost: map['postageCost'] as double,
      postageId: map['postageId'] as String,
      numberOfDays: map['numberOfDays'] as String,
    );
  }

  factory Postage.fromDocument(DocumentSnapshot document) {
    return new Postage(
      postageCost: document.data()['postageCost'] as double,
      postageId: document.id,
      numberOfDays: document.data()['numberOfDays'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'postageCost': this.postageCost,
      'totalCost': this.postageId,
      'numberOfDays': this.numberOfDays,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
