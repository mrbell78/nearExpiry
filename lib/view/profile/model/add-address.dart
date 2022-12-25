// To parse this JSON data, do
//
//     final addAddressResponseData = addAddressResponseDataFromJson(jsonString);

import 'dart:convert';

AddAddressResponseData addAddressResponseDataFromJson(String str) => AddAddressResponseData.fromJson(json.decode(str));

String addAddressResponseDataToJson(AddAddressResponseData data) => json.encode(data.toJson());

class AddAddressResponseData {
  AddAddressResponseData({
    required this.customerAddressId,
    required this.customerId,
    required this.addressType,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.address,
    required this.buildingName,
    required this.flatNo,
    required this.latitude,
    required this.longitude,
    required this.nearByLocation,
    required this.isDefault,
    this.status,
    required this.createdAt,
    this.updatedAt,
    this.countryName,
    this.stateName,
    this.cityName,
    required this.addressLine2,
    required this.zipCode,
    required this.phoneNumber,
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
  int latitude;
  int longitude;
  String nearByLocation;
  bool isDefault;
  dynamic status;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic countryName;
  dynamic stateName;
  dynamic cityName;
  String addressLine2;
  String zipCode;
  String phoneNumber;
  dynamic customerViewModel;

  factory AddAddressResponseData.fromJson(Map<String, dynamic> json) => AddAddressResponseData(
    customerAddressId: json["customerAddressId"],
    customerId: json["customerId"],
    addressType: json["addressType"],
    countryId: json["countryId"],
    stateId: json["stateId"],
    cityId: json["cityId"],
    address: json["address"],
    buildingName: json["buildingName"],
    flatNo: json["flatNo"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    nearByLocation: json["nearByLocation"],
    isDefault: json["isDefault"],
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
    "buildingName": buildingName,
    "flatNo": flatNo,
    "latitude": latitude,
    "longitude": longitude,
    "nearByLocation": nearByLocation,
    "isDefault": isDefault,
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
