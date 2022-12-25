// To parse this JSON data, do
//
//     final subCategoryItemList = subCategoryItemListFromJson(jsonString);

import 'dart:convert';

List<SubCategoryItemList> subCategoryItemListFromJson(String str) => List<SubCategoryItemList>.from(json.decode(str).map((x) => SubCategoryItemList.fromJson(x)));

String subCategoryItemListToJson(List<SubCategoryItemList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoryItemList {
  SubCategoryItemList({
    required this.categoryId,
    required this.name,
    required this.subTitle,
    required  this.largeImage,
    required  this.mediumImage,
    required  this.smallImage,
    required  this.level,
    required  this.guidId,
    required this.parentId,
    required this.logoClass,
    required  this.logoImage,
    required  this.childCategorys,
  });

  int categoryId;
  String name;
  dynamic subTitle;
  String largeImage;
  String mediumImage;
  String smallImage;
  int level;
  String guidId;
  int parentId;
  String logoClass;
  String logoImage;
  List<SubCategoryItemList> childCategorys;

  factory SubCategoryItemList.fromJson(Map<String, dynamic> json) => SubCategoryItemList(
    categoryId: json["categoryId"],
    name: json["name"],
    subTitle: json["subTitle"],
    largeImage: json["largeImage"],
    mediumImage: json["mediumImage"],
    smallImage: json["smallImage"],
    level: json["level"],
    guidId: json["guidId"],
    parentId: json["parentId"] == null ? null : json["parentId"],
    logoClass: json["logoClass"],
    logoImage: json["logoImage"],
    childCategorys: List<SubCategoryItemList>.from(json["childCategorys"].map((x) => SubCategoryItemList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
    "name": name,
    "subTitle": subTitle,
    "largeImage": largeImage,
    "mediumImage": mediumImage,
    "smallImage": smallImage,
    "level": level,
    "guidId": guidId,
    "parentId": parentId == null ? null : parentId,
    "logoClass": logoClass,
    "logoImage": logoImage,
    "childCategorys": List<dynamic>.from(childCategorys.map((x) => x.toJson())),
  };
}
