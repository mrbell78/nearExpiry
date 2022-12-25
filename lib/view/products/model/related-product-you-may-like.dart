// To parse this JSON data, do
//
//     final youMayLikeReletedProduct = youMayLikeReletedProductFromJson(jsonString);

import 'dart:convert';

List<YouMayLikeReletedProduct> youMayLikeReletedProductFromJson(String str) => List<YouMayLikeReletedProduct>.from(json.decode(str).map((x) => YouMayLikeReletedProduct.fromJson(x)));

String youMayLikeReletedProductToJson(List<YouMayLikeReletedProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class YouMayLikeReletedProduct {
  YouMayLikeReletedProduct({
    required this.productMasterId,
    required this.productName,
    required this.productType,
    required this.productTypeId,
    required this.productDecimal,
    required this.guidId,
    required this.urlKey,
    required this.metaTitle,
    required this.metaKeyword,
    required this.metaDesceiption,
    this.description,
    this.shortDescription,
    required this.totalRating,
    required this.totalReview,
    this.storeId,
    required this.isWished,
    required this.supplierId,
    required this.masterRequestMediaModels,
    required this.productSubSkuRequestModels,
  });

  int productMasterId;
  String productName;
  String productType;
  int productTypeId;
  double productDecimal;
  String guidId;
  String urlKey;
  String metaTitle;
  String metaKeyword;
  String metaDesceiption;
  dynamic description;
  dynamic shortDescription;
  double totalRating;
  double totalReview;
  dynamic storeId;
  bool isWished;
  int supplierId;
  List<MasterRequestMediaModel> masterRequestMediaModels;
  List<ProductSubSkuRequestModel> productSubSkuRequestModels;

  factory YouMayLikeReletedProduct.fromJson(Map<String, dynamic> json) => YouMayLikeReletedProduct(
    productMasterId: json["productMasterId"],
    productName: json["productName"],
    productType: json["productType"],
    productTypeId: json["productTypeId"],
    productDecimal: json["productDecimal"],
    guidId: json["guidId"],
    urlKey: json["urlKey"],
    metaTitle: json["metaTitle"],
    metaKeyword: json["metaKeyword"],
    metaDesceiption: json["metaDesceiption"],
    description: json["description"],
    shortDescription: json["shortDescription"],
    totalRating: json["totalRating"],
    totalReview: json["totalReview"],
    storeId: json["storeId"],
    isWished: json["isWished"],
    supplierId: json["supplierId"],
    masterRequestMediaModels: List<MasterRequestMediaModel>.from(json["masterRequestMediaModels"].map((x) => MasterRequestMediaModel.fromJson(x))),
    productSubSkuRequestModels: List<ProductSubSkuRequestModel>.from(json["productSubSkuRequestModels"].map((x) => ProductSubSkuRequestModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "productMasterId": productMasterId,
    "productName": productName,
    "productType": productType,
    "productTypeId": productTypeId,
    "productDecimal": productDecimal,
    "guidId": guidId,
    "urlKey": urlKey,
    "metaTitle": metaTitle,
    "metaKeyword": metaKeyword,
    "metaDesceiption": metaDesceiption,
    "description": description,
    "shortDescription": shortDescription,
    "totalRating": totalRating,
    "totalReview": totalReview,
    "storeId": storeId,
    "isWished": isWished,
    "supplierId": supplierId,
    "masterRequestMediaModels": List<dynamic>.from(masterRequestMediaModels.map((x) => x.toJson())),
    "productSubSkuRequestModels": List<dynamic>.from(productSubSkuRequestModels.map((x) => x.toJson())),
  };
}

class MasterRequestMediaModel {
  MasterRequestMediaModel({
    required this.productMasterMediaId,
    required this.productMasterId,
    required this.fileType,
    required this.fileName,
    required this.fileLocation,
    required this.videoEmbade,
    required this.fileKey,
    this.mediumImage,
    this.smallImage,
    this.productSubSkuId,
  });

  int productMasterMediaId;
  int productMasterId;
  String fileType;
  String fileName;
  String fileLocation;
  String videoEmbade;
  String fileKey;
  dynamic mediumImage;
  dynamic smallImage;
  dynamic productSubSkuId;

  factory MasterRequestMediaModel.fromJson(Map<String, dynamic> json) => MasterRequestMediaModel(
    productMasterMediaId: json["productMasterMediaId"],
    productMasterId: json["productMasterId"],
    fileType: json["fileType"],
    fileName: json["fileName"],
    fileLocation: json["fileLocation"],
    videoEmbade: json["videoEmbade"],
    fileKey: json["fileKey"],
    mediumImage: json["mediumImage"],
    smallImage: json["smallImage"],
    productSubSkuId: json["productSubSKUId"],
  );

  Map<String, dynamic> toJson() => {
    "productMasterMediaId": productMasterMediaId,
    "productMasterId": productMasterId,
    "fileType": fileType,
    "fileName": fileName,
    "fileLocation": fileLocation,
    "videoEmbade": videoEmbade,
    "fileKey": fileKey,
    "mediumImage": mediumImage,
    "smallImage": smallImage,
    "productSubSKUId": productSubSkuId,
  };
}

class ProductSubSkuRequestModel {
  ProductSubSkuRequestModel({
    required this.productSubSkuId,
    required this.productMasterId,
    required this.storeId,
    required this.subSku,
    this.previousPrice,
    required this.price,
    required this.quantity,
    this.attributeCombination,
    required this.attributeSetId,
    this.largeImage,
    required this.mediumImage,
    required this.smallImage,
    required this.videoEmbade,
    required this.symbol,
    required this.productSubSkuDetailsRequestModels,
  });

  int productSubSkuId;
  int productMasterId;
  int storeId;
  String subSku;
  dynamic previousPrice;
  double price;
  double quantity;
  dynamic attributeCombination;
  int attributeSetId;
  dynamic largeImage;
  String mediumImage;
  String smallImage;
  String videoEmbade;
  String symbol;
  List<dynamic> productSubSkuDetailsRequestModels;

  factory ProductSubSkuRequestModel.fromJson(Map<String, dynamic> json) => ProductSubSkuRequestModel(
    productSubSkuId: json["productSubSKUId"],
    productMasterId: json["productMasterId"],
    storeId: json["storeId"],
    subSku: json["subSKU"],
    previousPrice: json["previousPrice"],
    price: json["price"].toDouble(),
    quantity: json["quantity"],
    attributeCombination: json["attributeCombination"],
    attributeSetId: json["attributeSetId"],
    largeImage: json["largeImage"],
    mediumImage: json["mediumImage"],
    smallImage: json["smallImage"],
    videoEmbade: json["videoEmbade"],
    symbol: json["symbol"],
    productSubSkuDetailsRequestModels: List<dynamic>.from(json["productSubSkuDetailsRequestModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "productSubSKUId": productSubSkuId,
    "productMasterId": productMasterId,
    "storeId": storeId,
    "subSKU": subSku,
    "previousPrice": previousPrice,
    "price": price,
    "quantity": quantity,
    "attributeCombination": attributeCombination,
    "attributeSetId": attributeSetId,
    "largeImage": largeImage,
    "mediumImage": mediumImage,
    "smallImage": smallImage,
    "videoEmbade": videoEmbade,
    "symbol": symbol,
    "productSubSkuDetailsRequestModels": List<dynamic>.from(productSubSkuDetailsRequestModels.map((x) => x)),
  };
}
