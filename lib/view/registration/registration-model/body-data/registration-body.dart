// To parse this JSON data, do
//
//     final bodyRegistrationData = bodyRegistrationDataFromJson(jsonString);

import 'dart:convert';

BodyRegistrationData bodyRegistrationDataFromJson(String str) => BodyRegistrationData.fromJson(json.decode(str));

String bodyRegistrationDataToJson(BodyRegistrationData data) => json.encode(data.toJson());

class BodyRegistrationData {
  BodyRegistrationData({
    required this.customerId,
    required this.userName,
    required  this.email,
    required this.phoneNo,
    required this.password,
    required  this.createdAt,
    required this.updatedAt,
  });

  int customerId;
  String userName;
  String email;
  String phoneNo;
  String password;
  DateTime createdAt;
  DateTime updatedAt;

  factory BodyRegistrationData.fromJson(Map<String, dynamic> json) => BodyRegistrationData(
    customerId: json["customerId"],
    userName: json["userName"],
    email: json["email"],
    phoneNo: json["phoneNo"],
    password: json["password"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "customerId": customerId,
    "userName": userName,
    "email": email,
    "phoneNo": phoneNo,
    "password": password,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
