// To parse this JSON data, do
//
//     final parentCategory = parentCategoryFromJson(jsonString);

import 'dart:convert';

List<ParentCategory> parentCategoryFromJson(String str) => List<ParentCategory>.from(json.decode(str).map((x) => ParentCategory.fromJson(x)));

String parentCategoryToJson(List<ParentCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParentCategory {
  ParentCategory({
    required this.categoryId,
    required this.name,
    this.subTitle,
    required this.largeImage,
    required this.mediumImage,
    required this.smallImage,
    required this.level,
    required this.guidId,
    required this.parentId,
    required this.logoClass,
    required this.logoImage,
    required this.childCategorys,
  });

  int categoryId;
  String name;
  dynamic subTitle;
  String largeImage;
  String mediumImage;
  String smallImage;
  int level;
  String guidId;
  int? parentId;
  String logoClass;
  String logoImage;
  List<dynamic> childCategorys;

  factory ParentCategory.fromJson(Map<String, dynamic> json) => ParentCategory(
    categoryId: json["categoryId"],
    name: json["name"],
    subTitle: json["subTitle"],
    largeImage: json["largeImage"],
    mediumImage: json["mediumImage"],
    smallImage: json["smallImage"],
    level: json["level"],
    guidId: json["guidId"],
    parentId: json["parentId"],
    logoClass: json["logoClass"],
    logoImage: json["logoImage"],
    childCategorys: List<dynamic>.from(json["childCategorys"].map((x) => x)),
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
    "parentId": parentId,
    "logoClass": logoClass,
    "logoImage": logoImage,
    "childCategorys": List<dynamic>.from(childCategorys.map((x) => x)),
  };
}
