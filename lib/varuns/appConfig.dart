import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppConfig {
  double deliveryFee;
  String appStatus;

  //<editor-fold desc="Data Methods" defaultstate="collapsed">

  AppConfig({
    @required this.deliveryFee,
    @required this.appStatus,
    @required this.coupons,
    @required this.appVersion,
    @required this.discountPercent,
    @required this.appConfig,
    @required this.imgUrls,
  });

  AppConfig copyWith({
    double deliveryFee,
    String appStatus,
    List<dynamic> coupons,
    double appVersion,
    int discountPercent,
    String appConfig,
    List<dynamic> imgUrls,
  }) {
    return new AppConfig(
      deliveryFee: deliveryFee ?? this.deliveryFee,
      appStatus: appStatus ?? this.appStatus,
      coupons: coupons ?? this.coupons,
      appVersion: appVersion ?? this.appVersion,
      discountPercent: discountPercent ?? this.discountPercent,
      appConfig: appConfig ?? this.appConfig,
      imgUrls: imgUrls ?? this.imgUrls,
    );
  }

  @override
  String toString() {
    return 'AppConfig{deliveryFee: $deliveryFee, appStatus: $appStatus, coupons: $coupons, appVersion: $appVersion, discountPercent: $discountPercent, appConfig: $appConfig, imgUrls: $imgUrls}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppConfig &&
          runtimeType == other.runtimeType &&
          deliveryFee == other.deliveryFee &&
          appStatus == other.appStatus &&
          coupons == other.coupons &&
          appVersion == other.appVersion &&
          discountPercent == other.discountPercent &&
          appConfig == other.appConfig &&
          imgUrls == other.imgUrls);

  @override
  int get hashCode =>
      deliveryFee.hashCode ^
      appStatus.hashCode ^
      coupons.hashCode ^
      appVersion.hashCode ^
      discountPercent.hashCode ^
      appConfig.hashCode ^
      imgUrls.hashCode;

  factory AppConfig.fromMap(Map<String, dynamic> map) {
    return new AppConfig(
      deliveryFee: map['deliveryFee'] as double,
      appStatus: map['appStatus'] as String,
      coupons: map['coupons'] as List<dynamic>,
      appVersion: map['appVersion'] as double,
      discountPercent: map['discountPercent'] as int,
      appConfig: map['appConfig'] as String,
      imgUrls: map['imgUrls'] as List<dynamic>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'deliveryFee': this.deliveryFee,
      'appStatus': this.appStatus,
      'coupons': this.coupons,
      'appVersion': this.appVersion,
      'discountPercent': this.discountPercent,
      'appConfig': this.appConfig,
      'imgUrls': this.imgUrls,
    } as Map<String, dynamic>;
  }

  //</editor-fold>

  List<dynamic> coupons;
  double appVersion;
  int discountPercent;
  String appConfig;
  List<dynamic> imgUrls;
}
