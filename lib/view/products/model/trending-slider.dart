// To parse this JSON data, do
//
//     final trendingSlider = trendingSliderFromJson(jsonString);

import 'dart:convert';

List<TrendingSlider> trendingSliderFromJson(String str) => List<TrendingSlider>.from(json.decode(str).map((x) => TrendingSlider.fromJson(x)));

String trendingSliderToJson(List<TrendingSlider> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrendingSlider {
  TrendingSlider({
    required this.bannerId,
    required  this.title,
    required  this.subTitle,
    required this.categoryId,
    required  this.largeImage,
    required  this.smallImage,
    required  this.buttonLink,
    required   this.buttonText,
    required  this.smallDetails,
    required  this.bigDetails,
    required  this.slug,
    required  this.status,
    this.isDelete,
    required  this.bannerKey,
    required   this.createby,
    required  this.createdAt,
    required   this.lastUpdateAt,
    required   this.languageId,
    this.bannerCategoryMains,
    this.categoryViewModel,
    this.bannerCategoryViewModels,
  });

  int bannerId;
  String title;
  String subTitle;
  int categoryId;
  String largeImage;
  String smallImage;
  String buttonLink;
  String buttonText;
  String smallDetails;
  String bigDetails;
  String slug;
  String status;
  dynamic isDelete;
  String bannerKey;
  int createby;
  DateTime createdAt;
  DateTime lastUpdateAt;
  int languageId;
  dynamic bannerCategoryMains;
  dynamic categoryViewModel;
  dynamic bannerCategoryViewModels;

  factory TrendingSlider.fromJson(Map<String, dynamic> json) => TrendingSlider(
    bannerId: json["bannerId"],
    title: json["title"],
    subTitle: json["subTitle"],
    categoryId: json["categoryId"],
    largeImage: json["largeImage"],
    smallImage: json["smallImage"],
    buttonLink: json["buttonLink"],
    buttonText: json["buttonText"],
    smallDetails: json["smallDetails"],
    bigDetails: json["bigDetails"],
    slug: json["slug"],
    status: json["status"],
    isDelete: json["isDelete"],
    bannerKey: json["bannerKey"],
    createby: json["createby"],
    createdAt: DateTime.parse(json["createdAt"]),
    lastUpdateAt: DateTime.parse(json["lastUpdateAt"]),
    languageId: json["languageId"],
    bannerCategoryMains: json["bannerCategoryMains"],
    categoryViewModel: json["categoryViewModel"],
    bannerCategoryViewModels: json["bannerCategoryViewModels"],
  );

  Map<String, dynamic> toJson() => {
    "bannerId": bannerId,
    "title": title,
    "subTitle": subTitle,
    "categoryId": categoryId,
    "largeImage": largeImage,
    "smallImage": smallImage,
    "buttonLink": buttonLink,
    "buttonText": buttonText,
    "smallDetails": smallDetails,
    "bigDetails": bigDetails,
    "slug": slug,
    "status": status,
    "isDelete": isDelete,
    "bannerKey": bannerKey,
    "createby": createby,
    "createdAt": createdAt.toIso8601String(),
    "lastUpdateAt": lastUpdateAt.toIso8601String(),
    "languageId": languageId,
    "bannerCategoryMains": bannerCategoryMains,
    "categoryViewModel": categoryViewModel,
    "bannerCategoryViewModels": bannerCategoryViewModels,
  };
}
