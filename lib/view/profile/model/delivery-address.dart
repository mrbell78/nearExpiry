// To parse this JSON data, do
//
//     final deliveryAddress = deliveryAddressFromJson(jsonString);

import 'dart:convert';

List<DeliveryAddress> deliveryAddressFromJson(String str) => List<DeliveryAddress>.from(json.decode(str).map((x) => DeliveryAddress.fromJson(x)));

String deliveryAddressToJson(List<DeliveryAddress> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeliveryAddress {
  DeliveryAddress({
    required this.customerAddressId,
    required this.customerId,
    required this.addressType,
    required this.countryId,
    required  this.stateId,
    required  this.cityId,
    required  this.address,
    required  this.buildingName,
    required  this.flatNo,
    required  this.latitude,
    required  this.longitude,
    required  this.nearByLocation,
    required  this.isDefault,
    required  this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.countryName,
    required this.stateName,
    required  this.cityName,
    this.addressLine2,
    this.zipCode,
    this.phoneNumber,
    this.customerViewModel,
  });

  int customerAddressId;
  int customerId;
  String addressType;
  int countryId;
  int stateId;
  int cityId;
  String address;
  String buildingName;
  String flatNo;
  double latitude;
  double longitude;
  String nearByLocation;
  bool isDefault;
  dynamic status;
  DateTime createdAt;
  dynamic updatedAt;
  String countryName;
  String stateName;
  String cityName;
  dynamic addressLine2;
  dynamic zipCode;
  dynamic phoneNumber;
  dynamic customerViewModel;

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) => DeliveryAddress(
    customerAddressId: json["customerAddressId"],
    customerId: json["customerId"],
    addressType: json["addressType"],
    countryId: json["countryId"],
    stateId: json["stateId"],
    cityId: json["cityId"],
    address: json["address"],
    buildingName: json["buildingName"] == null ? null : json["buildingName"],
    flatNo: json["flatNo"] == null ? null : json["flatNo"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    nearByLocation: json["nearByLocation"] == null ? null : json["nearByLocation"],
    isDefault: json["isDefault"] == null ? null : json["isDefault"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"],
    countryName: json["countryName"],
    stateName: json["stateName"],
    cityName: json["cityName"],
    addressLine2: json["addressLine2"],
    zipCode: json["zipCode"],
    phoneNumber: json["phoneNumber"],
    customerViewModel: json["customerViewModel"],
  );

  Map<String, dynamic> toJson() => {
    "customerAddressId": customerAddressId,
    "customerId": customerId,
    "addressType": addressType,
    "countryId": countryId,
    "stateId": stateId,
    "cityId": cityId,
    "address": address,
    "buildingName": buildingName == null ? null : buildingName,
    "flatNo": flatNo == null ? null : flatNo,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "nearByLocation": nearByLocation == null ? null : nearByLocation,
    "isDefault": isDefault == null ? null : isDefault,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt,
    "countryName": countryName,
    "stateName": stateName,
    "cityName": cityName,
    "addressLine2": addressLine2,
    "zipCode": zipCode,
    "phoneNumber": phoneNumber,
    "customerViewModel": customerViewModel,
  };
}
