// To parse this JSON data, do
//
//     final myOrderList = myOrderListFromJson(jsonString);

import 'dart:convert';

List<MyOrderList> myOrderListFromJson(String str) => List<MyOrderList>.from(json.decode(str).map((x) => MyOrderList.fromJson(x)));

String myOrderListToJson(List<MyOrderList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyOrderList {
  MyOrderList({
    required this.invoiceMasterId,
    required this.customerId,
    required  this.refNumber,
    this.invoiceDate,
    required  this.totalAmount,
    required  this.receivedAmt,
    required   this.courierCharge,
    required  this.carryingCost,
    required  this.paymentMethod,
    required  this.remark,
    required  this.discountCode,
    required  this.discountValue,
    required  this.paymentStatus,
    required  this.status,
    this.currency,
    required  this.createdAt,
    this.countryId,
    this.stateId,
    this.cityId,
    this.driverId,
    required  this.totalRecords,
    required  this.billingAddressViewModels,
    required  this.shippingAddressViewModels,
    required  this.invoiceViewModels,
    required this.statusLogViewModels,
    required this.paymentViewModels,
    required  this.customerViewModel,
    required  this.invoiceDetailsViewModels,
    required  this.countryViewModel,
    required  this.stateViewModel,
    required  this.cityViewModel,
    required this.companyProfileViewModel,
    required this.invoiceInputFieldValueViewModel,
  });

  int invoiceMasterId;
  int customerId;
  String refNumber;
  dynamic invoiceDate;
  double totalAmount;
  double receivedAmt;
  double courierCharge;
  double carryingCost;
  int paymentMethod;
  String remark;
  String discountCode;
  double discountValue;
  int paymentStatus;
  String status;
  dynamic currency;
  DateTime createdAt;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  dynamic driverId;
  int totalRecords;
  IngAddressViewModels billingAddressViewModels;
  IngAddressViewModels shippingAddressViewModels;
  List<InvoiceViewModel> invoiceViewModels;
  List<StatusLogViewModel> statusLogViewModels;
  List<PaymentViewModel> paymentViewModels;
  CustomerViewModel customerViewModel;
  List<InvoiceDetailsViewModel> invoiceDetailsViewModels;
  CountryViewModel countryViewModel;
  StateViewModel stateViewModel;
  CityViewModel cityViewModel;
  CompanyProfileViewModel companyProfileViewModel;
  List<dynamic> invoiceInputFieldValueViewModel;

  factory MyOrderList.fromJson(Map<String, dynamic> json) => MyOrderList(
    invoiceMasterId: json["invoiceMasterId"],
    customerId: json["customerId"],
    refNumber: json["refNumber"],
    invoiceDate: json["invoiceDate"],
    totalAmount: json["totalAmount"],
    receivedAmt: json["receivedAmt"],
    courierCharge: json["courierCharge"],
    carryingCost: json["carryingCost"],
    paymentMethod: json["paymentMethod"],
    remark: json["remark"],
    discountCode: json["discountCode"],
    discountValue: json["discountValue"],
    paymentStatus: json["paymentStatus"],
    status: json["status"],
    currency: json["currency"],
    createdAt: DateTime.parse(json["createdAt"]),
    countryId: json["countryId"],
    stateId: json["stateId"],
    cityId: json["cityId"],
    driverId: json["driverId"],
    totalRecords: json["totalRecords"],
    billingAddressViewModels: IngAddressViewModels.fromJson(json["billingAddressViewModels"]),
    shippingAddressViewModels: IngAddressViewModels.fromJson(json["shippingAddressViewModels"]),
    invoiceViewModels: List<InvoiceViewModel>.from(json["invoiceViewModels"].map((x) => InvoiceViewModel.fromJson(x))),
    statusLogViewModels: List<StatusLogViewModel>.from(json["statusLogViewModels"].map((x) => StatusLogViewModel.fromJson(x))),
    paymentViewModels: List<PaymentViewModel>.from(json["paymentViewModels"].map((x) => PaymentViewModel.fromJson(x))),
    customerViewModel: CustomerViewModel.fromJson(json["customerViewModel"]),
    invoiceDetailsViewModels: List<InvoiceDetailsViewModel>.from(json["invoiceDetailsViewModels"].map((x) => InvoiceDetailsViewModel.fromJson(x))),
    countryViewModel: CountryViewModel.fromJson(json["countryViewModel"]),
    stateViewModel: StateViewModel.fromJson(json["stateViewModel"]),
    cityViewModel: CityViewModel.fromJson(json["cityViewModel"]),
    companyProfileViewModel: CompanyProfileViewModel.fromJson(json["companyProfileViewModel"]),
    invoiceInputFieldValueViewModel: List<dynamic>.from(json["invoiceInputFieldValueViewModel"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "invoiceMasterId": invoiceMasterId,
    "customerId": customerId,
    "refNumber": refNumber,
    "invoiceDate": invoiceDate,
    "totalAmount": totalAmount,
    "receivedAmt": receivedAmt,
    "courierCharge": courierCharge,
    "carryingCost": carryingCost,
    "paymentMethod": paymentMethod,
    "remark": remark,
    "discountCode": discountCode,
    "discountValue": discountValue,
    "paymentStatus": paymentStatus,
    "status": status,
    "currency": currency,
    "createdAt": createdAt.toIso8601String(),
    "countryId": countryId,
    "stateId": stateId,
    "cityId": cityId,
    "driverId": driverId,
    "totalRecords": totalRecords,
    "billingAddressViewModels": billingAddressViewModels.toJson(),
    "shippingAddressViewModels": shippingAddressViewModels.toJson(),
    "invoiceViewModels": List<dynamic>.from(invoiceViewModels.map((x) => x.toJson())),
    "statusLogViewModels": List<dynamic>.from(statusLogViewModels.map((x) => x.toJson())),
    "paymentViewModels": List<dynamic>.from(paymentViewModels.map((x) => x.toJson())),
    "customerViewModel": customerViewModel.toJson(),
    "invoiceDetailsViewModels": List<dynamic>.from(invoiceDetailsViewModels.map((x) => x.toJson())),
    "countryViewModel": countryViewModel.toJson(),
    "stateViewModel": stateViewModel.toJson(),
    "cityViewModel": cityViewModel.toJson(),
    "companyProfileViewModel": companyProfileViewModel.toJson(),
    "invoiceInputFieldValueViewModel": List<dynamic>.from(invoiceInputFieldValueViewModel.map((x) => x)),
  };
}

class IngAddressViewModels {
  IngAddressViewModels({
    required  this.billingShippingAddressId,
    required  this.invoiceMasterId,
    required  this.customerId,
    required  this.countryId,
    required  this.stateId,
    required  this.cityId,
    required  this.name,
    required  this.stateName,
    this.cityName,
    required  this.countryName,
    required  this.addressLine,
    required  this.addressLine2,
    required  this.zipCode,
    required  this.phoneNumber,
    required  this.landMark,
    required  this.deleveryNote,
    required  this.status,
    required  this.createdAt,
    required  this.updatedAt,
    required  this.isDefault,
    required  this.latitued,
    required  this.longitued,
    required  this.deleveryTime,
    required  this.isBilingAddress,
    required this.isShippingAddress,
  });

  int billingShippingAddressId;
  int invoiceMasterId;
  int customerId;
  int countryId;
  int stateId;
  int cityId;
  String name;
  String stateName;
  dynamic cityName;
  String countryName;
  String addressLine;
  String addressLine2;
  String zipCode;
  String phoneNumber;
  String landMark;
  String deleveryNote;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  bool isDefault;
  String latitued;
  String longitued;
  DateTime deleveryTime;
  bool isBilingAddress;
  bool isShippingAddress;

  factory IngAddressViewModels.fromJson(Map<String, dynamic> json) => IngAddressViewModels(
    billingShippingAddressId: json["billingShippingAddressId"],
    invoiceMasterId: json["invoiceMasterId"],
    customerId: json["customerId"],
    countryId: json["countryId"],
    stateId: json["stateId"],
    cityId: json["cityId"],
    name: json["name"],
    stateName: json["stateName"],
    cityName: json["cityName"],
    countryName: json["countryName"],
    addressLine: json["addressLine"],
    addressLine2: json["addressLine2"],
    zipCode: json["zipCode"],
    phoneNumber: json["phoneNumber"],
    landMark: json["landMark"],
    deleveryNote: json["deleveryNote"],
    status: json["status"],
    createdAt:json["createdAt"]!=null? DateTime.parse(json["createdAt"]):DateTime.now(),
    updatedAt: json["updatedAt"]!=null?DateTime.parse(json["updatedAt"]):DateTime.now(),
    isDefault: json["isDefault"],
    latitued: json["latitued"],
    longitued: json["longitued"],
    deleveryTime: json["deleveryTime"]!=null?DateTime.parse(json["deleveryTime"]):DateTime.now(),
    isBilingAddress: json["isBilingAddress"],
    isShippingAddress: json["isShippingAddress"],
  );

  Map<String, dynamic> toJson() => {
    "billingShippingAddressId": billingShippingAddressId,
    "invoiceMasterId": invoiceMasterId,
    "customerId": customerId,
    "countryId": countryId,
    "stateId": stateId,
    "cityId": cityId,
    "name": name,
    "stateName": stateName,
    "cityName": cityName,
    "countryName": countryName,
    "addressLine": addressLine,
    "addressLine2": addressLine2,
    "zipCode": zipCode,
    "phoneNumber": phoneNumber,
    "landMark": landMark,
    "deleveryNote": deleveryNote,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "isDefault": isDefault,
    "latitued": latitued,
    "longitued": longitued,
    "deleveryTime": deleveryTime.toIso8601String(),
    "isBilingAddress": isBilingAddress,
    "isShippingAddress": isShippingAddress,
  };
}

class CityViewModel {
  CityViewModel({
    required  this.cityId,
    required this.stateId,
    required  this.cityName,
    this.status,
    this.lastModified,
    this.isDeleted,
    this.stateName,
    this.guidId,
  });

  int cityId;
  int stateId;
  String cityName;
  dynamic status;
  dynamic lastModified;
  dynamic isDeleted;
  dynamic stateName;
  dynamic guidId;

  factory CityViewModel.fromJson(Map<String, dynamic> json) => CityViewModel(
    cityId: json["cityId"],
    stateId: json["stateId"],
    cityName: json["cityName"],
    status: json["status"],
    lastModified: json["lastModified"],
    isDeleted: json["isDeleted"],
    stateName: json["stateName"],
    guidId: json["guidId"],
  );

  Map<String, dynamic> toJson() => {
    "cityId": cityId,
    "stateId": stateId,
    "cityName": cityName,
    "status": status,
    "lastModified": lastModified,
    "isDeleted": isDeleted,
    "stateName": stateName,
    "guidId": guidId,
  };
}

class CompanyProfileViewModel {
  CompanyProfileViewModel({
    required  this.companyProfileId,
    this.companyName,
    this.vatNo,
    this.phone,
    this.email,
    this.address,
    this.logo,
    this.status,
    this.lastModified,
    this.isDeleted,
  });

  int companyProfileId;
  dynamic companyName;
  dynamic vatNo;
  dynamic phone;
  dynamic email;
  dynamic address;
  dynamic logo;
  dynamic status;
  dynamic lastModified;
  dynamic isDeleted;

  factory CompanyProfileViewModel.fromJson(Map<String, dynamic> json) => CompanyProfileViewModel(
    companyProfileId: json["companyProfileId"],
    companyName: json["companyName"],
    vatNo: json["vatNo"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    logo: json["logo"],
    status: json["status"],
    lastModified: json["lastModified"],
    isDeleted: json["isDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "companyProfileId": companyProfileId,
    "companyName": companyName,
    "vatNo": vatNo,
    "phone": phone,
    "email": email,
    "address": address,
    "logo": logo,
    "status": status,
    "lastModified": lastModified,
    "isDeleted": isDeleted,
  };
}

class CountryViewModel {
  CountryViewModel({
    required  this.countryId,
    this.iso,
    required  this.countryName,
    this.longCountryName,
    this.iso3,
    this.countryCode,
    this.unMemberState,
    this.callingCode,
    this.ccTld,
    this.status,
    this.lastModified,
    this.isDeleted,
    this.guidId,
    this.manualStoreId,
    this.image,
    required  this.countryWiseStoreViewModels,
  });

  int countryId;
  dynamic iso;
  String countryName;
  dynamic longCountryName;
  dynamic iso3;
  dynamic countryCode;
  dynamic unMemberState;
  dynamic callingCode;
  dynamic ccTld;
  dynamic status;
  dynamic lastModified;
  dynamic isDeleted;
  dynamic guidId;
  dynamic manualStoreId;
  dynamic image;
  List<dynamic> countryWiseStoreViewModels;

  factory CountryViewModel.fromJson(Map<String, dynamic> json) => CountryViewModel(
    countryId: json["countryId"],
    iso: json["iso"],
    countryName: json["countryName"],
    longCountryName: json["longCountryName"],
    iso3: json["iso3"],
    countryCode: json["countryCode"],
    unMemberState: json["unMemberState"],
    callingCode: json["callingCode"],
    ccTld: json["ccTld"],
    status: json["status"],
    lastModified: json["lastModified"],
    isDeleted: json["isDeleted"],
    guidId: json["guidId"],
    manualStoreId: json["manualStoreId"],
    image: json["image"],
    countryWiseStoreViewModels: List<dynamic>.from(json["countryWiseStoreViewModels"].map((x) => x)),
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
    "status": status,
    "lastModified": lastModified,
    "isDeleted": isDeleted,
    "guidId": guidId,
    "manualStoreId": manualStoreId,
    "image": image,
    "countryWiseStoreViewModels": List<dynamic>.from(countryWiseStoreViewModels.map((x) => x)),
  };
}

class CustomerViewModel {
  CustomerViewModel({
    required  this.customerId,
    this.userName,
    required  this.firstName,
    required  this.middleName,
    required  this.lastName,
    required  this.email,
    this.email2,
    this.phoneNo,
    this.phoneNo2,
    this.phoneNo3,
    required  this.gender,
    this.dateOfBirth,
    this.points,
    this.pointInValue,
    this.ratings,
    this.totalOrders,
    this.isBlacklisted,
    this.isCorporate,
    this.isNewsletterSub,
    this.isReviewEnable,
    this.isUpdatePassword,
    this.isUpdateAddress,
    required  this.password,
    this.accountType,
    this.customerTypeId,
    this.token,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    required  this.customerGroupId,
    this.taxorVatNumber,
    required  this.totalOrder,
    this.walletBalance,
    required   this.totalRecords,
    required  this.customerGroupViewModel,
    required   this.customerAddressViewModels,
    required  this.customerAddressViewModel,
    required  this.walletTransactionViewModels,
    this.invoiceMasterViewModel,
    required  this.invoiceMasterViewModels,
    this.cartResponseModels,
    required  this.firstLastName,
  });

  int customerId;
  dynamic userName;
  String firstName;
  String middleName;
  String lastName;
  String email;
  dynamic email2;
  dynamic phoneNo;
  dynamic phoneNo2;
  dynamic phoneNo3;
  int gender;
  dynamic dateOfBirth;
  dynamic points;
  dynamic pointInValue;
  dynamic ratings;
  dynamic totalOrders;
  dynamic isBlacklisted;
  dynamic isCorporate;
  dynamic isNewsletterSub;
  dynamic isReviewEnable;
  dynamic isUpdatePassword;
  dynamic isUpdateAddress;
  String password;
  dynamic accountType;
  dynamic customerTypeId;
  dynamic token;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic isDeleted;
  int customerGroupId;
  dynamic taxorVatNumber;
  int totalOrder;
  dynamic walletBalance;
  int totalRecords;
  CustomerGroupViewModel customerGroupViewModel;
  List<CustomerAddressViewModel> customerAddressViewModels;
  CustomerAddressViewModel customerAddressViewModel;
  List<dynamic> walletTransactionViewModels;
  dynamic invoiceMasterViewModel;
  List<dynamic> invoiceMasterViewModels;
  dynamic cartResponseModels;
  String firstLastName;

  factory CustomerViewModel.fromJson(Map<String, dynamic> json) => CustomerViewModel(
    customerId: json["customerId"],
    userName: json["userName"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    email: json["email"],
    email2: json["email2"],
    phoneNo: json["phoneNo"],
    phoneNo2: json["phoneNo2"],
    phoneNo3: json["phoneNo3"],
    gender: json["gender"],
    dateOfBirth: json["dateOfBirth"],
    points: json["points"],
    pointInValue: json["pointInValue"],
    ratings: json["ratings"],
    totalOrders: json["totalOrders"],
    isBlacklisted: json["isBlacklisted"],
    isCorporate: json["isCorporate"],
    isNewsletterSub: json["isNewsletterSub"],
    isReviewEnable: json["isReviewEnable"],
    isUpdatePassword: json["isUpdatePassword"],
    isUpdateAddress: json["isUpdateAddress"],
    password: json["password"],
    accountType: json["accountType"],
    customerTypeId: json["customerTypeId"],
    token: json["token"],
    status: json["status"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    isDeleted: json["isDeleted"],
    customerGroupId: json["customerGroupId"],
    taxorVatNumber: json["taxorVatNumber"],
    totalOrder: json["totalOrder"],
    walletBalance: json["walletBalance"],
    totalRecords: json["totalRecords"],
    customerGroupViewModel: CustomerGroupViewModel.fromJson(json["customerGroupViewModel"]),
    customerAddressViewModels: List<CustomerAddressViewModel>.from(json["customerAddressViewModels"].map((x) => CustomerAddressViewModel.fromJson(x))),
    customerAddressViewModel: CustomerAddressViewModel.fromJson(json["customerAddressViewModel"]),
    walletTransactionViewModels: List<dynamic>.from(json["walletTransactionViewModels"].map((x) => x)),
    invoiceMasterViewModel: json["invoiceMasterViewModel"],
    invoiceMasterViewModels: List<dynamic>.from(json["invoiceMasterViewModels"].map((x) => x)),
    cartResponseModels: json["cartResponseModels"],
    firstLastName: json["firstLastName"],
  );

  Map<String, dynamic> toJson() => {
    "customerId": customerId,
    "userName": userName,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "email": email,
    "email2": email2,
    "phoneNo": phoneNo,
    "phoneNo2": phoneNo2,
    "phoneNo3": phoneNo3,
    "gender": gender,
    "dateOfBirth": dateOfBirth,
    "points": points,
    "pointInValue": pointInValue,
    "ratings": ratings,
    "totalOrders": totalOrders,
    "isBlacklisted": isBlacklisted,
    "isCorporate": isCorporate,
    "isNewsletterSub": isNewsletterSub,
    "isReviewEnable": isReviewEnable,
    "isUpdatePassword": isUpdatePassword,
    "isUpdateAddress": isUpdateAddress,
    "password": password,
    "accountType": accountType,
    "customerTypeId": customerTypeId,
    "token": token,
    "status": status,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "isDeleted": isDeleted,
    "customerGroupId": customerGroupId,
    "taxorVatNumber": taxorVatNumber,
    "totalOrder": totalOrder,
    "walletBalance": walletBalance,
    "totalRecords": totalRecords,
    "customerGroupViewModel": customerGroupViewModel.toJson(),
    "customerAddressViewModels": List<dynamic>.from(customerAddressViewModels.map((x) => x.toJson())),
    "customerAddressViewModel": customerAddressViewModel.toJson(),
    "walletTransactionViewModels": List<dynamic>.from(walletTransactionViewModels.map((x) => x)),
    "invoiceMasterViewModel": invoiceMasterViewModel,
    "invoiceMasterViewModels": List<dynamic>.from(invoiceMasterViewModels.map((x) => x)),
    "cartResponseModels": cartResponseModels,
    "firstLastName": firstLastName,
  };
}

class CustomerAddressViewModel {
  CustomerAddressViewModel({
    required  this.customerAddressId,
    required   this.customerId,
    required  this.addressType,
    required  this.countryId,
    required  this.stateId,
    required  this.cityId,
    required  this.address,
    this.buildingName,
    this.flatNo,
    this.latitude,
    this.longitude,
    this.nearByLocation,
    required   this.isDefault,
    this.status,
    required   this.createdAt,
    this.updatedAt,
    required  this.countryName,
    required  this.stateName,
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
  dynamic buildingName;
  dynamic flatNo;
  dynamic latitude;
  dynamic longitude;
  dynamic nearByLocation;
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

  factory CustomerAddressViewModel.fromJson(Map<String, dynamic> json) => CustomerAddressViewModel(
    customerAddressId: json["customerAddressId"],
    customerId: json["customerId"],
    addressType: json["addressType"] == null ? null : json["addressType"],
    countryId: json["countryId"],
    stateId: json["stateId"],
    cityId: json["cityId"],
    address: json["address"] == null ? null : json["address"],
    buildingName: json["buildingName"],
    flatNo: json["flatNo"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    nearByLocation: json["nearByLocation"],
    isDefault: json["isDefault"] == null ? null : json["isDefault"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"],
    countryName: json["countryName"] == null ? null : json["countryName"],
    stateName: json["stateName"] == null ? null : json["stateName"],
    cityName: json["cityName"] == null ? null : json["cityName"],
    addressLine2: json["addressLine2"],
    zipCode: json["zipCode"],
    phoneNumber: json["phoneNumber"],
    customerViewModel: json["customerViewModel"],
  );

  Map<String, dynamic> toJson() => {
    "customerAddressId": customerAddressId,
    "customerId": customerId,
    "addressType": addressType == null ? null : addressType,
    "countryId": countryId,
    "stateId": stateId,
    "cityId": cityId,
    "address": address == null ? null : address,
    "buildingName": buildingName,
    "flatNo": flatNo,
    "latitude": latitude,
    "longitude": longitude,
    "nearByLocation": nearByLocation,
    "isDefault": isDefault == null ? null : isDefault,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt,
    "countryName": countryName == null ? null : countryName,
    "stateName": stateName == null ? null : stateName,
    "cityName": cityName == null ? null : cityName,
    "addressLine2": addressLine2,
    "zipCode": zipCode,
    "phoneNumber": phoneNumber,
    "customerViewModel": customerViewModel,
  };
}

class CustomerGroupViewModel {
  CustomerGroupViewModel({
    required  this.customerGroupId,
    required  this.groupName,
    this.taxClass,
    this.isDeleted,
    required this.createdAt,
    this.updatedAt,
  });

  int customerGroupId;
  String groupName;
  dynamic taxClass;
  dynamic isDeleted;
  DateTime createdAt;
  dynamic updatedAt;

  factory CustomerGroupViewModel.fromJson(Map<String, dynamic> json) => CustomerGroupViewModel(
    customerGroupId: json["customerGroupId"],
    groupName: json["groupName"],
    taxClass: json["taxClass"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "customerGroupId": customerGroupId,
    "groupName": groupName,
    "taxClass": taxClass,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt,
  };
}

class InvoiceDetailsViewModel {
  InvoiceDetailsViewModel({
    required  this.invoiceDetailsId,
    required  this.invoiceId,
    required   this.productMasterId,
    required   this.quantity,
    required   this.price,
    required  this.status,
    required  this.createdAt,
    required  this.productTypeId,
    this.storeId,
    this.supplierId,
    this.supplierName,
    this.supplierMobile,
    required   this.productName,
    this.invoiceMasterId,
    required  this.productSkuId,
    required  this.subSku,
    required   this.largeImage,
    required  this.mediumImage,
    this.smallImage,
    this.fileLocation,
    this.digitalProductGuid,
    this.digitalProductUrl,
    this.serviceDate,
    this.brandName,
    required this.productSubSkuViewModels,
  });

  int invoiceDetailsId;
  int invoiceId;
  int productMasterId;
  double quantity;
  double price;
  String status;
  DateTime createdAt;
  int productTypeId;
  dynamic storeId;
  dynamic supplierId;
  dynamic supplierName;
  dynamic supplierMobile;
  String productName;
  dynamic invoiceMasterId;
  int productSkuId;
  String subSku;
  String largeImage;
  String mediumImage;
  dynamic smallImage;
  dynamic fileLocation;
  dynamic digitalProductGuid;
  dynamic digitalProductUrl;
  dynamic serviceDate;
  dynamic brandName;
  List<dynamic> productSubSkuViewModels;

  factory InvoiceDetailsViewModel.fromJson(Map<String, dynamic> json) => InvoiceDetailsViewModel(
    invoiceDetailsId: json["invoiceDetailsId"],
    invoiceId: json["invoiceId"],
    productMasterId: json["productMasterId"],
    quantity: json["quantity"],
    price: json["price"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    productTypeId: json["productTypeId"],
    storeId: json["storeId"],
    supplierId: json["supplierId"],
    supplierName: json["supplierName"],
    supplierMobile: json["supplierMobile"],
    productName: json["productName"],
    invoiceMasterId: json["invoiceMasterId"],
    productSkuId: json["productSkuId"],
    subSku: json["subSku"],
    largeImage: json["largeImage"],
    mediumImage: json["mediumImage"],
    smallImage: json["smallImage"],
    fileLocation: json["fileLocation"],
    digitalProductGuid: json["digitalProductGuid"],
    digitalProductUrl: json["digitalProductUrl"],
    serviceDate: json["serviceDate"],
    brandName: json["brandName"],
    productSubSkuViewModels: List<dynamic>.from(json["productSubSKUViewModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "invoiceDetailsId": invoiceDetailsId,
    "invoiceId": invoiceId,
    "productMasterId": productMasterId,
    "quantity": quantity,
    "price": price,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "productTypeId": productTypeId,
    "storeId": storeId,
    "supplierId": supplierId,
    "supplierName": supplierName,
    "supplierMobile": supplierMobile,
    "productName": productName,
    "invoiceMasterId": invoiceMasterId,
    "productSkuId": productSkuId,
    "subSku": subSku,
    "largeImage": largeImage,
    "mediumImage": mediumImage,
    "smallImage": smallImage,
    "fileLocation": fileLocation,
    "digitalProductGuid": digitalProductGuid,
    "digitalProductUrl": digitalProductUrl,
    "serviceDate": serviceDate,
    "brandName": brandName,
    "productSubSKUViewModels": List<dynamic>.from(productSubSkuViewModels.map((x) => x)),
  };
}

class InvoiceViewModel {
  InvoiceViewModel({
    required  this.invoiceId,
    required   this.invoiceMasterId,
    required  this.refNumber,
    required  this.invoiceDate,
    required  this.totalAmount,
    required   this.receivedAmt,
    required  this.carryingCost,
    required this.courierCharge,
    required  this.paymentMethod,
    required this.paymentStatus,
    this.supplierId,
    required   this.remark,
    required  this.discountCode,
    required  this.discountValue,
    required  this.storeId,
    required  this.status,
    this.createdAt,
    required this.invoiceStatusId,
    required this.amountToSupplier,
    required  this.amountToAdmin,
    required  this.supplierCommissionId,
    this.methodName,
    this.isService,
    this.serviceDate,
    this.supplierName,
    required this.storeViewModel,
    required this.invoiceStatusViewModel,
  });

  int invoiceId;
  int invoiceMasterId;
  String refNumber;
  DateTime invoiceDate;
  double totalAmount;
  double receivedAmt;
  double carryingCost;
  double courierCharge;
  int paymentMethod;
  int paymentStatus;
  dynamic supplierId;
  String remark;
  String discountCode;
  double discountValue;
  int storeId;
  String status;
  dynamic createdAt;
  int invoiceStatusId;
  double amountToSupplier;
  double amountToAdmin;
  int supplierCommissionId;
  dynamic methodName;
  dynamic isService;
  dynamic serviceDate;
  dynamic supplierName;
  StoreViewModel storeViewModel;
  InvoiceStatusViewModel invoiceStatusViewModel;

  factory InvoiceViewModel.fromJson(Map<String, dynamic> json) => InvoiceViewModel(
    invoiceId: json["invoiceId"],
    invoiceMasterId: json["invoiceMasterId"],
    refNumber: json["refNumber"],
    invoiceDate: DateTime.parse(json["invoiceDate"]),
    totalAmount: json["totalAmount"],
    receivedAmt: json["receivedAmt"],
    carryingCost: json["carryingCost"],
    courierCharge: json["courierCharge"],
    paymentMethod: json["paymentMethod"],
    paymentStatus: json["paymentStatus"],
    supplierId: json["supplierId"],
    remark: json["remark"],
    discountCode: json["discountCode"],
    discountValue: json["discountValue"],
    storeId: json["storeId"],
    status: json["status"],
    createdAt: json["createdAt"],
    invoiceStatusId: json["invoiceStatusId"],
    amountToSupplier: json["amountToSupplier"].toDouble(),
    amountToAdmin: json["amountToAdmin"].toDouble(),
    supplierCommissionId: json["supplierCommissionId"],
    methodName: json["methodName"],
    isService: json["isService"],
    serviceDate: json["serviceDate"],
    supplierName: json["supplierName"],
    storeViewModel: StoreViewModel.fromJson(json["storeViewModel"]),
    invoiceStatusViewModel: InvoiceStatusViewModel.fromJson(json["invoiceStatusViewModel"]),
  );

  Map<String, dynamic> toJson() => {
    "invoiceId": invoiceId,
    "invoiceMasterId": invoiceMasterId,
    "refNumber": refNumber,
    "invoiceDate": invoiceDate.toIso8601String(),
    "totalAmount": totalAmount,
    "receivedAmt": receivedAmt,
    "carryingCost": carryingCost,
    "courierCharge": courierCharge,
    "paymentMethod": paymentMethod,
    "paymentStatus": paymentStatus,
    "supplierId": supplierId,
    "remark": remark,
    "discountCode": discountCode,
    "discountValue": discountValue,
    "storeId": storeId,
    "status": status,
    "createdAt": createdAt,
    "invoiceStatusId": invoiceStatusId,
    "amountToSupplier": amountToSupplier,
    "amountToAdmin": amountToAdmin,
    "supplierCommissionId": supplierCommissionId,
    "methodName": methodName,
    "isService": isService,
    "serviceDate": serviceDate,
    "supplierName": supplierName,
    "storeViewModel": storeViewModel.toJson(),
    "invoiceStatusViewModel": invoiceStatusViewModel.toJson(),
  };
}

class InvoiceStatusViewModel {
  InvoiceStatusViewModel({
    required  this.invoiceStatusId,
    required  this.name,
    required  this.active,
    required  this.createDate,
    this.isPublic,
    this.isInternal,
    this.isDelete,
    required  this.label,
    this.settingName,
    required this.invoiceStatusSettingId,
    this.isService,
    this.isEmail,
    this.isSmS,
    this.isPushNotification,
    this.isCustomer,
    this.isAdmin,
    this.smSTemplateId,
    this.smSTemplateTitle,
    this.emailTemplateId,
    this.emailTemplateTitle,
    this.pushNotificationId,
    this.pushNotificationTitle,
  });

  int invoiceStatusId;
  String name;
  bool active;
  DateTime createDate;
  dynamic isPublic;
  dynamic isInternal;
  dynamic isDelete;
  int label;
  dynamic settingName;
  int invoiceStatusSettingId;
  dynamic isService;
  dynamic isEmail;
  dynamic isSmS;
  dynamic isPushNotification;
  dynamic isCustomer;
  dynamic isAdmin;
  dynamic smSTemplateId;
  dynamic smSTemplateTitle;
  dynamic emailTemplateId;
  dynamic emailTemplateTitle;
  dynamic pushNotificationId;
  dynamic pushNotificationTitle;

  factory InvoiceStatusViewModel.fromJson(Map<String, dynamic> json) => InvoiceStatusViewModel(
    invoiceStatusId: json["invoiceStatusId"],
    name: json["name"],
    active: json["active"],
    createDate: DateTime.parse(json["createDate"]),
    isPublic: json["isPublic"],
    isInternal: json["isInternal"],
    isDelete: json["isDelete"],
    label: json["label"],
    settingName: json["settingName"],
    invoiceStatusSettingId: json["invoiceStatusSettingId"],
    isService: json["isService"],
    isEmail: json["isEmail"],
    isSmS: json["isSmS"],
    isPushNotification: json["isPushNotification"],
    isCustomer: json["isCustomer"],
    isAdmin: json["isAdmin"],
    smSTemplateId: json["smSTemplateId"],
    smSTemplateTitle: json["smSTemplateTitle"],
    emailTemplateId: json["emailTemplateId"],
    emailTemplateTitle: json["emailTemplateTitle"],
    pushNotificationId: json["pushNotificationId"],
    pushNotificationTitle: json["pushNotificationTitle"],
  );

  Map<String, dynamic> toJson() => {
    "invoiceStatusId": invoiceStatusId,
    "name": name,
    "active": active,
    "createDate": createDate.toIso8601String(),
    "isPublic": isPublic,
    "isInternal": isInternal,
    "isDelete": isDelete,
    "label": label,
    "settingName": settingName,
    "invoiceStatusSettingId": invoiceStatusSettingId,
    "isService": isService,
    "isEmail": isEmail,
    "isSmS": isSmS,
    "isPushNotification": isPushNotification,
    "isCustomer": isCustomer,
    "isAdmin": isAdmin,
    "smSTemplateId": smSTemplateId,
    "smSTemplateTitle": smSTemplateTitle,
    "emailTemplateId": emailTemplateId,
    "emailTemplateTitle": emailTemplateTitle,
    "pushNotificationId": pushNotificationId,
    "pushNotificationTitle": pushNotificationTitle,
  };
}

class StoreViewModel {
  StoreViewModel({
    required  this.storeId,
    this.supplierId,
    required this.shopName,
    this.mobile,
    this.landPhone,
    this.email,
    this.address,
    this.largeImage,
    this.mediumImage,
    this.smallImage,
    this.parentId,
    required this.parentStoreId,
    this.latitued,
    this.longitued,
    this.description,
    this.countryId,
    this.stateId,
    this.cityId,
    this.status,
    required  this.createdAt,
    this.updatedAt,
    this.guidId,
    this.currencyId,
    this.countryName,
    this.mapUrl,
    required  this.manualStoreId,
    required  this.manualParentStoreId,
    this.supplierName,
    required  this.isManagedWareHouse,
    required  this.breadcrumb,
    required this.childStores,
    required this.storeOperationViewModels,
    this.storeSummaryViewModels,
    required  this.storeParentViewModels,
  });

  int storeId;
  dynamic supplierId;
  String shopName;
  dynamic mobile;
  dynamic landPhone;
  dynamic email;
  dynamic address;
  dynamic largeImage;
  dynamic mediumImage;
  dynamic smallImage;
  dynamic parentId;
  int parentStoreId;
  dynamic latitued;
  dynamic longitued;
  dynamic description;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  dynamic status;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic guidId;
  dynamic currencyId;
  dynamic countryName;
  dynamic mapUrl;
  int manualStoreId;
  int manualParentStoreId;
  dynamic supplierName;
  bool isManagedWareHouse;
  List<dynamic> breadcrumb;
  List<dynamic> childStores;
  List<dynamic> storeOperationViewModels;
  dynamic storeSummaryViewModels;
  List<dynamic> storeParentViewModels;

  factory StoreViewModel.fromJson(Map<String, dynamic> json) => StoreViewModel(
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
    parentId: json["parentId"],
    parentStoreId: json["parentStoreId"],
    latitued: json["latitued"],
    longitued: json["longitued"],
    description: json["description"],
    countryId: json["countryId"],
    stateId: json["stateId"],
    cityId: json["cityId"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"],
    guidId: json["guidId"],
    currencyId: json["currencyId"],
    countryName: json["countryName"],
    mapUrl: json["mapUrl"],
    manualStoreId: json["manualStoreId"],
    manualParentStoreId: json["manualParentStoreId"],
    supplierName: json["supplierName"],
    isManagedWareHouse: json["isManagedWareHouse"],
    breadcrumb: List<dynamic>.from(json["breadcrumb"].map((x) => x)),
    childStores: List<dynamic>.from(json["childStores"].map((x) => x)),
    storeOperationViewModels: List<dynamic>.from(json["storeOperationViewModels"].map((x) => x)),
    storeSummaryViewModels: json["storeSummaryViewModels"],
    storeParentViewModels: List<dynamic>.from(json["storeParentViewModels"].map((x) => x)),
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
    "parentId": parentId,
    "parentStoreId": parentStoreId,
    "latitued": latitued,
    "longitued": longitued,
    "description": description,
    "countryId": countryId,
    "stateId": stateId,
    "cityId": cityId,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt,
    "guidId": guidId,
    "currencyId": currencyId,
    "countryName": countryName,
    "mapUrl": mapUrl,
    "manualStoreId": manualStoreId,
    "manualParentStoreId": manualParentStoreId,
    "supplierName": supplierName,
    "isManagedWareHouse": isManagedWareHouse,
    "breadcrumb": List<dynamic>.from(breadcrumb.map((x) => x)),
    "childStores": List<dynamic>.from(childStores.map((x) => x)),
    "storeOperationViewModels": List<dynamic>.from(storeOperationViewModels.map((x) => x)),
    "storeSummaryViewModels": storeSummaryViewModels,
    "storeParentViewModels": List<dynamic>.from(storeParentViewModels.map((x) => x)),
  };
}

class PaymentViewModel {
  PaymentViewModel({
    required  this.paymentId,
    required  this.invoiceMasterId,
    required  this.currencyId,
    required this.amount,
    required this.courierCharge,
    required  this.discountAmount,
    required this.carryingCost,
    required this.paymentMethod,
    this.courierAgencyId,
    required this.payDate,
    required this.note,
    required  this.transactionNo,
    required  this.status,
    required  this.createdAt,
    required  this.couponId,
    this.currencyName,
    this.symbol,
    required  this.methodName,
    required  this.statusName,
    required  this.currencyViewModel,
  });

  int paymentId;
  int invoiceMasterId;
  int currencyId;
  double amount;
  double courierCharge;
  double discountAmount;
  double carryingCost;
  int paymentMethod;
  dynamic courierAgencyId;
  DateTime payDate;
  String note;
  String transactionNo;
  String status;
  DateTime createdAt;
  int couponId;
  dynamic currencyName;
  dynamic symbol;
  String methodName;
  String statusName;
  CurrencyViewModel currencyViewModel;

  factory PaymentViewModel.fromJson(Map<String, dynamic> json) => PaymentViewModel(
    paymentId: json["paymentId"],
    invoiceMasterId: json["invoiceMasterId"],
    currencyId: json["currencyId"],
    amount: json["amount"].toDouble(),
    courierCharge: json["courierCharge"],
    discountAmount: json["discountAmount"],
    carryingCost: json["carryingCost"],
    paymentMethod: json["paymentMethod"],
    courierAgencyId: json["courierAgencyId"],
    payDate: DateTime.parse(json["payDate"]),
    note: json["note"],
    transactionNo: json["transactionNo"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    couponId: json["couponId"],
    currencyName: json["currencyName"],
    symbol: json["symbol"],
    methodName: json["methodName"],
    statusName: json["statusName"],
    currencyViewModel: CurrencyViewModel.fromJson(json["currencyViewModel"]),
  );

  Map<String, dynamic> toJson() => {
    "paymentId": paymentId,
    "invoiceMasterId": invoiceMasterId,
    "currencyId": currencyId,
    "amount": amount,
    "courierCharge": courierCharge,
    "discountAmount": discountAmount,
    "carryingCost": carryingCost,
    "paymentMethod": paymentMethod,
    "courierAgencyId": courierAgencyId,
    "payDate": payDate.toIso8601String(),
    "note": note,
    "transactionNo": transactionNo,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "couponId": couponId,
    "currencyName": currencyName,
    "symbol": symbol,
    "methodName": methodName,
    "statusName": statusName,
    "currencyViewModel": currencyViewModel.toJson(),
  };
}

class CurrencyViewModel {
  CurrencyViewModel({
    required  this.currencyId,
    this.name,
    required  this.code,
    required  this.symbol,
    this.isDelete,
    this.isBaseCurrency,
    required  this.convertionRate,
    this.convertionPrice,
    this.createDate,
  });

  int currencyId;
  dynamic name;
  String code;
  String symbol;
  dynamic isDelete;
  dynamic isBaseCurrency;
  int convertionRate;
  dynamic convertionPrice;
  dynamic createDate;

  factory CurrencyViewModel.fromJson(Map<String, dynamic> json) => CurrencyViewModel(
    currencyId: json["currencyId"],
    name: json["name"],
    code: json["code"],
    symbol: json["symbol"],
    isDelete: json["isDelete"],
    isBaseCurrency: json["isBaseCurrency"],
    convertionRate: json["convertionRate"],
    convertionPrice: json["convertionPrice"],
    createDate: json["createDate"],
  );

  Map<String, dynamic> toJson() => {
    "currencyId": currencyId,
    "name": name,
    "code": code,
    "symbol": symbol,
    "isDelete": isDelete,
    "isBaseCurrency": isBaseCurrency,
    "convertionRate": convertionRate,
    "convertionPrice": convertionPrice,
    "createDate": createDate,
  };
}

class StateViewModel {
  StateViewModel({
    required  this.stateId,
    required this.countryId,
    this.countryName,
    required  this.stateName,
    this.isDeleted,
    this.guidId,
  });

  int stateId;
  int countryId;
  dynamic countryName;
  String stateName;
  dynamic isDeleted;
  dynamic guidId;

  factory StateViewModel.fromJson(Map<String, dynamic> json) => StateViewModel(
    stateId: json["stateId"],
    countryId: json["countryId"],
    countryName: json["countryName"],
    stateName: json["stateName"],
    isDeleted: json["isDeleted"],
    guidId: json["guidId"],
  );

  Map<String, dynamic> toJson() => {
    "stateId": stateId,
    "countryId": countryId,
    "countryName": countryName,
    "stateName": stateName,
    "isDeleted": isDeleted,
    "guidId": guidId,
  };
}

class StatusLogViewModel {
  StatusLogViewModel({
    required  this.statusLogId,
    required this.invoiceId,
    required this.currentInvoiceStatusId,
    this.nextInvoiceStatusId,
    required this.dateTime,
    this.duration,
    this.note,
    this.createBy,
    this.currentInvoiceStatus,
    required  this.previousInvoiceStatus,
    this.durationTime,
  });

  int statusLogId;
  int invoiceId;
  int currentInvoiceStatusId;
  dynamic nextInvoiceStatusId;
  DateTime dateTime;
  dynamic duration;
  dynamic note;
  dynamic createBy;
  dynamic currentInvoiceStatus;
  String previousInvoiceStatus;
  dynamic durationTime;

  factory StatusLogViewModel.fromJson(Map<String, dynamic> json) => StatusLogViewModel(
    statusLogId: json["statusLogId"],
    invoiceId: json["invoiceId"],
    currentInvoiceStatusId: json["currentInvoiceStatusId"],
    nextInvoiceStatusId: json["nextInvoiceStatusId"],
    dateTime: DateTime.parse(json["dateTime"]),
    duration: json["duration"],
    note: json["note"],
    createBy: json["createBy"],
    currentInvoiceStatus: json["currentInvoiceStatus"],
    previousInvoiceStatus: json["previousInvoiceStatus"],
    durationTime: json["durationTime"],
  );

  Map<String, dynamic> toJson() => {
    "statusLogId": statusLogId,
    "invoiceId": invoiceId,
    "currentInvoiceStatusId": currentInvoiceStatusId,
    "nextInvoiceStatusId": nextInvoiceStatusId,
    "dateTime": dateTime.toIso8601String(),
    "duration": duration,
    "note": note,
    "createBy": createBy,
    "currentInvoiceStatus": currentInvoiceStatus,
    "previousInvoiceStatus": previousInvoiceStatus,
    "durationTime": durationTime,
  };
}
