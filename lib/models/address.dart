class Address {
  String unitNumber;
  String postCode;
  String addressLineOne;
  String addressLineTwo;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Address({
    this.unitNumber,
    this.postCode,
    this.addressLineOne,
    this.addressLineTwo,
  });

  @override
  String toString() {
    return 'Address{unitNumber: $unitNumber, postCode: $postCode, addressLineOne: $addressLineOne, addressLineTwo: $addressLineTwo}';
  }

  factory Address.fromMap(Map<dynamic, dynamic> map) {
    return new Address(
      unitNumber: map['unitNumber'] as String,
      postCode: map['postCode'] as String,
      addressLineOne: map['addressLineOne'] as String,
      addressLineTwo: map['addressLineTwo'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'unitNumber': this.unitNumber,
      'postCode': this.postCode,
      'addressLineOne': this.addressLineOne,
      'addressLineTwo': this.addressLineTwo,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
