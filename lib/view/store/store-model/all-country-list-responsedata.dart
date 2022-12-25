// To parse this JSON data, do
//
//     final allCountryListResponseData = allCountryListResponseDataFromJson(jsonString);

import 'dart:convert';

List<AllCountryListResponseData> allCountryListResponseDataFromJson(String str) => List<AllCountryListResponseData>.from(json.decode(str).map((x) => AllCountryListResponseData.fromJson(x)));

String allCountryListResponseDataToJson(List<AllCountryListResponseData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllCountryListResponseData {
  AllCountryListResponseData({

    required this.countryId,
    required this.iso,
    required this.countryName,
    required this.longCountryName,
    required this.iso3,
    required this.countryCode,
    required this.unMemberState,
    required this.callingCode,
    required this.ccTld,
    required this.guidId,
    required this.image,
  });

  int countryId;
  String iso;
  String countryName;
  String longCountryName;
  String iso3;
  String countryCode;
  String unMemberState;
  String callingCode;
  String ccTld;
  String guidId;
  String image;

  factory AllCountryListResponseData.fromJson(Map<String, dynamic> json) => AllCountryListResponseData(
    countryId: json["countryId"],
    iso: json["iso"],
    countryName: json["countryName"],
    longCountryName: json["longCountryName"],
    iso3: json["iso3"],
    countryCode: json["countryCode"],
    unMemberState: json["unMemberState"],
    callingCode: json["callingCode"],
    ccTld: json["ccTld"],
    guidId: json["guidId"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "countryId": countryId,
    "iso": iso,
    "countryName": countryName,
    "longCountryName": longCountryName,
    "iso3": iso3,
    "countryCode": countryCode,
    "unMemberState": unMemberState,
    "callingCode": callingCode,
    "ccTld": ccTld,
    "guidId": guidId,
    "image": image,
  };
}
