// To parse this JSON data, do
//
//     final myOrderCheckOut = myOrderCheckOutFromJson(jsonString);

import 'dart:convert';

MyOrderCheckOut myOrderCheckOutFromJson(String str) => MyOrderCheckOut.fromJson(json.decode(str));

String myOrderCheckOutToJson(MyOrderCheckOut data) => json.encode(data.toJson());

class MyOrderCheckOut {
  MyOrderCheckOut({
    required this.invoiceMasterId,
    required this.customerId,
    required this.refNumber,
    required  this.invoiceDate,
    required  this.totalAmount,
    required  this.receivedAmt,
    required  this.courierCharge,
    required  this.carryingCost,
    required  this.paymentMethod,
    required  this.remark,
    required  this.discountCode,
    required this.discountValue,
    required  this.paymentStatus,
    this.status,
    required this.createdAt,
    required this.countryId,
    required  this.stateId,
    required  this.cityId,
    required  this.invoiceStatusId,
    required  this.invoiceRequestModels,
    required this.paymentRequestModels,
    required this.billingShippingAddressRequestModels,
    required  this.inputFieldValueRequestModels,
  });

  int invoiceMasterId;
  int customerId;
  String refNumber;
  DateTime invoiceDate;
  double totalAmount;
  double receivedAmt;
  double courierCharge;
  double carryingCost;
  int paymentMethod;
  dynamic remark;
  dynamic discountCode;
  dynamic discountValue;
  int paymentStatus;
  dynamic status;
  DateTime createdAt;
  int countryId;
  int stateId;
  int cityId;
  int invoiceStatusId;
  List<InvoiceRequestModel> invoiceRequestModels;
  List<PaymentRequestModel> paymentRequestModels;
  List<BillingShippingAddressRequestModel> billingShippingAddressRequestModels;
  List<dynamic> inputFieldValueRequestModels;

  factory MyOrderCheckOut.fromJson(Map<String, dynamic> json) => MyOrderCheckOut(
    invoiceMasterId: json["invoiceMasterId"],
    customerId: json["customerId"],
    refNumber: json["refNumber"],
    invoiceDate: DateTime.parse(json["invoiceDate"]),
    totalAmount: json["totalAmount"].toDouble(),
    receivedAmt: json["receivedAmt"].toDouble(),
    courierCharge: json["courierCharge"],
    carryingCost: json["carryingCost"],
    paymentMethod: json["paymentMethod"],
    remark: json["remark"],
    discountCode: json["discountCode"],
    discountValue: json["discountValue"],
    paymentStatus: json["paymentStatus"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    countryId: json["countryId"],
    stateId: json["stateId"],
    cityId: json["cityId"],
    invoiceStatusId: json["invoiceStatusId"],
    invoiceRequestModels: List<InvoiceRequestModel>.from(json["invoiceRequestModels"].map((x) => InvoiceRequestModel.fromJson(x))),
    paymentRequestModels: List<PaymentRequestModel>.from(json["paymentRequestModels"].map((x) => PaymentRequestModel.fromJson(x))),
    billingShippingAddressRequestModels: List<BillingShippingAddressRequestModel>.from(json["billingShippingAddressRequestModels"].map((x) => BillingShippingAddressRequestModel.fromJson(x))),
    inputFieldValueRequestModels: List<dynamic>.from(json["inputFieldValueRequestModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "invoiceMasterId": invoiceMasterId,
    "customerId": customerId,
    "refNumber": refNumber,
    "invoiceDate": invoiceDate.toIso8601String(),
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
    "createdAt": createdAt.toIso8601String(),
    "countryId": countryId,
    "stateId": stateId,
    "cityId": cityId,
    "invoiceStatusId": invoiceStatusId,
    "invoiceRequestModels": List<dynamic>.from(invoiceRequestModels.map((x) => x.toJson())),
    "paymentRequestModels": List<dynamic>.from(paymentRequestModels.map((x) => x.toJson())),
    "billingShippingAddressRequestModels": List<dynamic>.from(billingShippingAddressRequestModels.map((x) => x.toJson())),
    "inputFieldValueRequestModels": List<dynamic>.from(inputFieldValueRequestModels.map((x) => x)),
  };
}

class BillingShippingAddressRequestModel {
  BillingShippingAddressRequestModel({
    required  this.billingShippingAddressId,
    this.invoiceMasterId,
    required  this.customerId,
    required  this.countryId,
    required  this.stateId,
    required  this.cityId,
    required  this.name,
    required  this.addressLine,
    this.addressLine2,
    this.landMark,
    this.deleveryNote,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.zipCode,
    this.phoneNumber,
    this.isDefault,
    this.latitued,
    this.longitued,
    this.deleveryTime,
    required this.isBilingAddress,
    required this.isShippingAddress,
    required this.customerAddressId,
  });

  int billingShippingAddressId;
  dynamic invoiceMasterId;
  int customerId;
  int countryId;
  int stateId;
  int cityId;
  String name;
  String addressLine;
  dynamic addressLine2;
  dynamic landMark;
  dynamic deleveryNote;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic zipCode;
  dynamic phoneNumber;
  dynamic isDefault;
  dynamic latitued;
  dynamic longitued;
  dynamic deleveryTime;
  bool isBilingAddress;
  bool isShippingAddress;
  int customerAddressId;

  factory BillingShippingAddressRequestModel.fromJson(Map<String, dynamic> json) => BillingShippingAddressRequestModel(
    billingShippingAddressId: json["billingShippingAddressId"],
    invoiceMasterId: json["invoiceMasterId"],
    customerId: json["customerId"],
    countryId: json["countryId"],
    stateId: json["stateId"],
    cityId: json["cityId"],
    name: json["name"],
    addressLine: json["addressLine"],
    addressLine2: json["addressLine2"],
    landMark: json["landMark"],
    deleveryNote: json["deleveryNote"],
    status: json["status"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    zipCode: json["zipCode"],
    phoneNumber: json["phoneNumber"],
    isDefault: json["isDefault"],
    latitued: json["latitued"],
    longitued: json["longitued"],
    deleveryTime: json["deleveryTime"],
    isBilingAddress: json["isBilingAddress"],
    isShippingAddress: json["isShippingAddress"],
    customerAddressId: json["customerAddressId"],
  );

  Map<String, dynamic> toJson() => {
    "billingShippingAddressId": billingShippingAddressId,
    "invoiceMasterId": invoiceMasterId,
    "customerId": customerId,
    "countryId": countryId,
    "stateId": stateId,
    "cityId": cityId,
    "name": name,
    "addressLine": addressLine,
    "addressLine2": addressLine2,
    "landMark": landMark,
    "deleveryNote": deleveryNote,
    "status": status,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "zipCode": zipCode,
    "phoneNumber": phoneNumber,
    "isDefault": isDefault,
    "latitued": latitued,
    "longitued": longitued,
    "deleveryTime": deleveryTime,
    "isBilingAddress": isBilingAddress,
    "isShippingAddress": isShippingAddress,
    "customerAddressId": customerAddressId,
  };
}

class InvoiceRequestModel {
  InvoiceRequestModel({
    required  this.invoiceId,
    required  this.invoiceMasterId,
    this.refNumber,
    required this.invoiceDate,
    required  this.totalAmount,
    required  this.receivedAmt,
    required  this.carryingCost,
    required  this.courierCharge,
    required  this.paymentMethod,
    required this.paymentStatus,
    required  this.remark,
    this.discountCode,
    this.discountValue,
    required  this.storeId,
    this.status,
    this.createdAt,
    required  this.supplierId,
    required  this.invoiceStatusId,
    required  this.amountToSupplier,
    required  this.amountToAdmin,
    this.supplierCommissionId,
    this.isService,
    this.isDigitalProduct,
    this.isQuotationProduct,
    this.serviceDate,
    this.serviceDateTime,
    this.serviceTime,
    required  this.invoiceDetailsRequestModels,
    required   this.invoiceDetailsViewModels,
  });

  int invoiceId;
  int invoiceMasterId;
  dynamic refNumber;
  DateTime invoiceDate;
  double totalAmount;
  double receivedAmt;
  double carryingCost;
  double courierCharge;
  int paymentMethod;
  int paymentStatus;
  String remark;
  dynamic discountCode;
  dynamic discountValue;
  int storeId;
  dynamic status;
  dynamic createdAt;
  int supplierId;
  int invoiceStatusId;
  double amountToSupplier;
  double amountToAdmin;
  dynamic supplierCommissionId;
  dynamic isService;
  dynamic isDigitalProduct;
  dynamic isQuotationProduct;
  dynamic serviceDate;
  dynamic serviceDateTime;
  dynamic serviceTime;
  List<InvoiceDetailsRequestModel> invoiceDetailsRequestModels;
  List<dynamic> invoiceDetailsViewModels;

  factory InvoiceRequestModel.fromJson(Map<String, dynamic> json) => InvoiceRequestModel(
    invoiceId: json["invoiceId"],
    invoiceMasterId: json["invoiceMasterId"],
    refNumber: json["refNumber"],
    invoiceDate: DateTime.parse(json["invoiceDate"]),
    totalAmount: json["totalAmount"].toDouble(),
    receivedAmt: json["receivedAmt"].toDouble(),
    carryingCost: json["carryingCost"],
    courierCharge: json["courierCharge"],
    paymentMethod: json["paymentMethod"],
    paymentStatus: json["paymentStatus"],
    remark: json["remark"],
    discountCode: json["discountCode"],
    discountValue: json["discountValue"],
    storeId: json["storeId"],
    status: json["status"],
    createdAt: json["createdAt"],
    supplierId: json["supplierId"],
    invoiceStatusId: json["invoiceStatusId"],
    amountToSupplier: json["amountToSupplier"].toDouble(),
    amountToAdmin: json["amountToAdmin"].toDouble(),
    supplierCommissionId: json["supplierCommissionId"],
    isService: json["isService"],
    isDigitalProduct: json["isDigitalProduct"],
    isQuotationProduct: json["isQuotationProduct"],
    serviceDate: json["serviceDate"],
    serviceDateTime: json["serviceDateTime"],
    serviceTime: json["serviceTime"],
    invoiceDetailsRequestModels: List<InvoiceDetailsRequestModel>.from(json["invoiceDetailsRequestModels"].map((x) => InvoiceDetailsRequestModel.fromJson(x))),
    invoiceDetailsViewModels: json["invoiceDetailsViewModels"]!=null?List<dynamic>.from(json["invoiceDetailsViewModels"].map((x) => x)): <dynamic>[],
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
    "remark": remark,
    "discountCode": discountCode,
    "discountValue": discountValue,
    "storeId": storeId,
    "status": status,
    "createdAt": createdAt,
    "supplierId": supplierId,
    "invoiceStatusId": invoiceStatusId,
    "amountToSupplier": amountToSupplier,
    "amountToAdmin": amountToAdmin,
    "supplierCommissionId": supplierCommissionId,
    "isService": isService,
    "isDigitalProduct": isDigitalProduct,
    "isQuotationProduct": isQuotationProduct,
    "serviceDate": serviceDate,
    "serviceDateTime": serviceDateTime,
    "serviceTime": serviceTime,
    "invoiceDetailsRequestModels": List<dynamic>.from(invoiceDetailsRequestModels.map((x) => x.toJson())),
    "invoiceDetailsViewModels": List<dynamic>.from(invoiceDetailsViewModels.map((x) => x)),
  };
}

class InvoiceDetailsRequestModel {
  InvoiceDetailsRequestModel({
    required  this.invoiceDetailsId,
    required  this.invoiceId,
    required  this.productMasterId,
    required  this.quantity,
    required  this.price,
    this.status,
    this.createdAt,
    required  this.productSubSkuId,
  });

  int invoiceDetailsId;
  int invoiceId;
  int productMasterId;
  double quantity;
  double price;
  dynamic status;
  dynamic createdAt;
  int productSubSkuId;

  factory InvoiceDetailsRequestModel.fromJson(Map<String, dynamic> json) => InvoiceDetailsRequestModel(
    invoiceDetailsId: json["invoiceDetailsId"],
    invoiceId: json["invoiceId"],
    productMasterId: json["productMasterId"],
    quantity: json["quantity"],
    price: json["price"].toDouble(),
    status: json["status"],
    createdAt: json["createdAt"],
    productSubSkuId: json["productSubSKUId"],
  );

  Map<String, dynamic> toJson() => {
    "invoiceDetailsId": invoiceDetailsId,
    "invoiceId": invoiceId,
    "productMasterId": productMasterId,
    "quantity": quantity,
    "price": price,
    "status": status,
    "createdAt": createdAt,
    "productSubSKUId": productSubSkuId,
  };
}

class PaymentRequestModel {
  PaymentRequestModel({
    required  this.paymentId,
    this.invoiceMasterId,
    required  this.currencyId,
    required  this.amount,
    required  this.courierCharge,
    this.discountAmount,
    required  this.carryingCost,
    required  this.paymentMethod,
    this.courierAgencyId,
    required  this.payDate,
    this.note,
    this.transactionNo,
    this.status,
    this.createdAt,
    this.couponId,
  });

  int paymentId;
  dynamic invoiceMasterId;
  int currencyId;
  double amount;
  double courierCharge;
  dynamic discountAmount;
  double carryingCost;
  int paymentMethod;
  dynamic courierAgencyId;
  DateTime payDate;
  dynamic note;
  dynamic transactionNo;
  dynamic status;
  dynamic createdAt;
  dynamic couponId;

  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) => PaymentRequestModel(
    paymentId: json["paymentId"],
    invoiceMasterId: json["invoiceMasterId"],
    currencyId: json["currencyId"],
    amount: json["amount"].toDouble(),
    courierCharge: json["courierCharge"],
    discountAmount: json["discountAmount"],
    carryingCost: json["carryingCost"],
    paymentMethod: json["paymentMethod"],
    courierAgencyId: json["courierAgencyId"],
    payDate: json["payDate"]!=null?DateTime.parse(json["payDate"]):DateTime.now(),
    note: json["note"],
    transactionNo: json["transactionNo"],
    status: json["status"],
    createdAt: json["createdAt"],
    couponId: json["couponId"],
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
    "createdAt": createdAt,
    "couponId": couponId,
  };
}
