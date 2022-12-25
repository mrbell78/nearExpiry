// To parse this JSON data, do
//
//     final storeListResponseData = storeListResponseDataFromJson(jsonString);

import 'dart:convert';

List<StoreListResponseData> storeListResponseDataFromJson(String str) => List<StoreListResponseData>.from(json.decode(str).map((x) => StoreListResponseData.fromJson(x)));

String storeListResponseDataToJson(List<StoreListResponseData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreListResponseData {
  StoreListResponseData({
    required this.storeId,
    required this.supplierId,
    required this.shopName,
    required this.mobile,
    required  this.landPhone,
    required this.email,
    required this.address,
    required  this.largeImage,
    required  this.mediumImage,
    required  this.smallImage,
      this.parentId,
    required  this.latitued,
    required this.longitued,
    required  this.description,
    required  this.countryId,
    required  this.stateId,
    required this.cityId,
    required  this.countryImage,
  });

  int? storeId;
  int supplierId;
  String shopName;
  String mobile;
  String landPhone;
  String email;
  String address;
  String largeImage;
  String mediumImage;
  String smallImage;
  int? parentId;
  String latitued;
  String longitued;
  String description;
  int countryId;
  int? stateId;
  int? cityId;
  String countryImage;

  factory StoreListResponseData.fromJson(Map<String, dynamic> json) => StoreListResponseData(
    storeId: json["storeId"],
    supplierId: json["supplierId"],
    shopName: json["shopName"],
    mobile: json["mobile"],
    landPhone: json["landPhone"],
    email: json["email"],
    address: json["address"],
    largeImage: json["largeImage"],
    mediumImage: json["mediumImage"],
    smallImage: json["smallImage"],
    parentId: json["parentId"] == null ? null : json["parentId"],
    latitued: json["latitued"],
    longitued: json["longitued"],
    description: json["description"],
    countryId: json["countryId"],
    stateId: json["stateId"] == null ? null : json["stateId"],
    cityId: json["cityId"] == null ? null : json["cityId"],
    countryImage: json["countryImage"],
  );

  Map<String, dynamic> toJson() => {
    "storeId": storeId,
    "supplierId": supplierId,
    "shopName": shopName,
    "mobile": mobile,
    "landPhone": landPhone,
    "email": email,
    "address": address,
    "largeImage": largeImage,
    "mediumImage": mediumImage,
    "smallImage": smallImage,
    "parentId": parentId == null ? null : parentId,
    "latitued": latitued,
    "longitued": longitued,
    "description": description,
    "countryId": countryId,
    "stateId": stateId == null ? null : stateId,
    "cityId": cityId == null ? null : cityId,
    "countryImage": countryImage,
  };
}
