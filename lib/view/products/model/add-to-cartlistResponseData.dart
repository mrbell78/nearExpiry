// To parse this JSON data, do
//
//     final addtoCartList = addtoCartListFromJson(jsonString);

import 'dart:convert';

List<AddtoCartListResponseData> addtoCartListFromJson(String str) => List<AddtoCartListResponseData>.from(json.decode(str).map((x) => AddtoCartListResponseData.fromJson(x)));

String addtoCartListToJson(List<AddtoCartListResponseData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddtoCartListResponseData {
  AddtoCartListResponseData({
    required this.cartId,
    required this.productMasterId,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.smallImage,
    required  this.symbol,
    required this.productSubSkuId,
    required  this.supplierId,
    required  this.storeId,
    required  this.serviceDateTime,
    required this.inputFieldValueRequestModels,
  });

  int cartId;
  int productMasterId;
  String productName;
  double quantity;
  double price;
  String smallImage;
  String symbol;
  int productSubSkuId;
  int supplierId;
  int storeId;
  DateTime? serviceDateTime;
  List<InputFieldValueRequestModel>? inputFieldValueRequestModels;

  factory AddtoCartListResponseData.fromJson(Map<String, dynamic> json) => AddtoCartListResponseData(
    cartId: json["cartId"] == null ? null : json["cartId"],
    productMasterId: json["productMasterId"] == null ? null : json["productMasterId"],
    productName: json["productName"] == null ? null : json["productName"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    price: json["price"] == null ? null : json["price"],
    smallImage: json["smallImage"] == null ? null : json["smallImage"],
    symbol: json["symbol"] == null ? null : json["symbol"],
    productSubSkuId: json["productSubSKUId"] == null ? null : json["productSubSKUId"],
    supplierId: json["supplierId"] == null ? null : json["supplierId"],
    storeId: json["storeId"] == null ? null : json["storeId"],
    serviceDateTime: json["serviceDateTime"] == null ? null : DateTime.parse(json["serviceDateTime"]),
    inputFieldValueRequestModels: json["inputFieldValueRequestModels"] == null ? null : List<InputFieldValueRequestModel>.from(json["inputFieldValueRequestModels"].map((x) => InputFieldValueRequestModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cartId": cartId == null ? null : cartId,
    "productMasterId": productMasterId == null ? null : productMasterId,
    "productName": productName == null ? null : productName,
    "quantity": quantity == null ? null : quantity,
    "price": price == null ? null : price,
    "smallImage": smallImage == null ? null : smallImage,
    "symbol": symbol == null ? null : symbol,
    "productSubSKUId": productSubSkuId == null ? null : productSubSkuId,
    "supplierId": supplierId == null ? null : supplierId,
    "storeId": storeId == null ? null : storeId,
    "serviceDateTime": serviceDateTime == null ? null : serviceDateTime!.toIso8601String(),
    "inputFieldValueRequestModels": inputFieldValueRequestModels == null ? null : List<dynamic>.from(inputFieldValueRequestModels!.map((x) => x.toJson())),
  };
}

class InputFieldValueRequestModel {
  InputFieldValueRequestModel({
    required this.inputFieldListId,
    required this.inputFieldValue,
  });

  int inputFieldListId;
  String inputFieldValue;

  factory InputFieldValueRequestModel.fromJson(Map<String, dynamic> json) => InputFieldValueRequestModel(
    inputFieldListId: json["inputFieldListId"] == null ? null : json["inputFieldListId"],
    inputFieldValue: json["inputFieldValue"] == null ? null : json["inputFieldValue"],
  );

  Map<String, dynamic> toJson() => {
    "inputFieldListId": inputFieldListId == null ? null : inputFieldListId,
    "inputFieldValue": inputFieldValue == null ? null : inputFieldValue,
  };
}
