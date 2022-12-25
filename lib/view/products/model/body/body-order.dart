class BodyOrder {
  final int? invoiceMasterId;
  final int? customerId;
  final String? refNumber;
  final String? invoiceDate;
  final double? totalAmount;
  final double? receivedAmt;
  final int? courierCharge;
  final int? carryingCost;
  final int? paymentMethod;
  final dynamic remark;
  final dynamic discountCode;
  final dynamic discountValue;
  final int? paymentStatus;
  final dynamic status;
  final String? createdAt;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final int? invoiceStatusId;
  final List<InvoiceRequestModels>? invoiceRequestModels;
  final List<PaymentRequestModels>? paymentRequestModels;
  final List<BillingShippingAddressRequestModels>? billingShippingAddressRequestModels;
  final List<dynamic>? inputFieldValueRequestModels;

  BodyOrder({
    this.invoiceMasterId,
    this.customerId,
    this.refNumber,
    this.invoiceDate,
    this.totalAmount,
    this.receivedAmt,
    this.courierCharge,
    this.carryingCost,
    this.paymentMethod,
    this.remark,
    this.discountCode,
    this.discountValue,
    this.paymentStatus,
    this.status,
    this.createdAt,
    this.countryId,
    this.stateId,
    this.cityId,
    this.invoiceStatusId,
    this.invoiceRequestModels,
    this.paymentRequestModels,
    this.billingShippingAddressRequestModels,
    this.inputFieldValueRequestModels,
  });

  BodyOrder.fromJson(Map<String, dynamic> json)
      : invoiceMasterId = json['InvoiceMasterId'] as int?,
        customerId = json['CustomerId'] as int?,
        refNumber = json['RefNumber'] as String?,
        invoiceDate = json['InvoiceDate'] as String?,
        totalAmount = json['TotalAmount'] as double?,
        receivedAmt = json['ReceivedAmt'] as double?,
        courierCharge = json['CourierCharge'] as int?,
        carryingCost = json['CarryingCost'] as int?,
        paymentMethod = json['PaymentMethod'] as int?,
        remark = json['Remark'],
        discountCode = json['DiscountCode'],
        discountValue = json['DiscountValue'],
        paymentStatus = json['PaymentStatus'] as int?,
        status = json['Status'],
        createdAt = json['CreatedAt'] as String?,
        countryId = json['CountryId'] as int?,
        stateId = json['StateId'] as int?,
        cityId = json['CityId'] as int?,
        invoiceStatusId = json['InvoiceStatusId'] as int?,
        invoiceRequestModels = (json['InvoiceRequestModels'] as List?)?.map((dynamic e) => InvoiceRequestModels.fromJson(e as Map<String,dynamic>)).toList(),
        paymentRequestModels = (json['PaymentRequestModels'] as List?)?.map((dynamic e) => PaymentRequestModels.fromJson(e as Map<String,dynamic>)).toList(),
        billingShippingAddressRequestModels = (json['BillingShippingAddressRequestModels'] as List?)?.map((dynamic e) => BillingShippingAddressRequestModels.fromJson(e as Map<String,dynamic>)).toList(),
        inputFieldValueRequestModels = json['InputFieldValueRequestModels'] as List?;

  Map<String, dynamic> toJson() => {
    'InvoiceMasterId' : invoiceMasterId,
    'CustomerId' : customerId,
    'RefNumber' : refNumber,
    'InvoiceDate' : invoiceDate,
    'TotalAmount' : totalAmount,
    'ReceivedAmt' : receivedAmt,
    'CourierCharge' : courierCharge,
    'CarryingCost' : carryingCost,
    'PaymentMethod' : paymentMethod,
    'Remark' : remark,
    'DiscountCode' : discountCode,
    'DiscountValue' : discountValue,
    'PaymentStatus' : paymentStatus,
    'Status' : status,
    'CreatedAt' : createdAt,
    'CountryId' : countryId,
    'StateId' : stateId,
    'CityId' : cityId,
    'InvoiceStatusId' : invoiceStatusId,
    'InvoiceRequestModels' : invoiceRequestModels?.map((e) => e.toJson()).toList(),
    'PaymentRequestModels' : paymentRequestModels?.map((e) => e.toJson()).toList(),
    'BillingShippingAddressRequestModels' : billingShippingAddressRequestModels?.map((e) => e.toJson()).toList(),
    'InputFieldValueRequestModels' : inputFieldValueRequestModels
  };
}

class InvoiceRequestModels {
  final int? invoiceId;
  final dynamic invoiceMasterId;
  final dynamic refNumber;
  final String? invoiceDate;
  final double? totalAmount;
  final double? receivedAmt;
  final int? carryingCost;
  final int? courierCharge;
  final int? paymentMethod;
  final dynamic paymentStatus;
  final String? remark;
  final dynamic discountCode;
  final dynamic discountValue;
  final int? storeId;
  final dynamic status;
  final dynamic createdAt;
  final int? supplierId;
  final int? invoiceStatusId;
  final double? amountToSupplier;
  final double? amountToAdmin;
  final dynamic supplierCommissionId;
  final dynamic isService;
  final dynamic isDigitalProduct;
  final dynamic isQuotationProduct;
  final dynamic serviceDate;
  final dynamic serviceDateTime;
  final dynamic serviceTime;
  final List<InvoiceDetailsRequestModels>? invoiceDetailsRequestModels;
  final List<dynamic>? invoiceDetailsViewModels;

  InvoiceRequestModels({
    this.invoiceId,
    this.invoiceMasterId,
    this.refNumber,
    this.invoiceDate,
    this.totalAmount,
    this.receivedAmt,
    this.carryingCost,
    this.courierCharge,
    this.paymentMethod,
    this.paymentStatus,
    this.remark,
    this.discountCode,
    this.discountValue,
    this.storeId,
    this.status,
    this.createdAt,
    this.supplierId,
    this.invoiceStatusId,
    this.amountToSupplier,
    this.amountToAdmin,
    this.supplierCommissionId,
    this.isService,
    this.isDigitalProduct,
    this.isQuotationProduct,
    this.serviceDate,
    this.serviceDateTime,
    this.serviceTime,
    this.invoiceDetailsRequestModels,
    this.invoiceDetailsViewModels,
  });

  InvoiceRequestModels.fromJson(Map<String, dynamic> json)
      : invoiceId = json['InvoiceId'] as int?,
        invoiceMasterId = json['InvoiceMasterId'],
        refNumber = json['RefNumber'],
        invoiceDate = json['InvoiceDate'] as String?,
        totalAmount = json['TotalAmount'] as double?,
        receivedAmt = json['ReceivedAmt'] as double?,
        carryingCost = json['CarryingCost'] as int?,
        courierCharge = json['CourierCharge'] as int?,
        paymentMethod = json['PaymentMethod'] as int?,
        paymentStatus = json['PaymentStatus'],
        remark = json['Remark'] as String?,
        discountCode = json['DiscountCode'],
        discountValue = json['DiscountValue'],
        storeId = json['StoreId'] as int?,
        status = json['Status'],
        createdAt = json['CreatedAt'],
        supplierId = json['SupplierId'] as int?,
        invoiceStatusId = json['InvoiceStatusId'] as int?,
        amountToSupplier = json['AmountToSupplier'] as double?,
        amountToAdmin = json['AmountToAdmin'] as double?,
        supplierCommissionId = json['SupplierCommissionId'],
        isService = json['IsService'],
        isDigitalProduct = json['IsDigitalProduct'],
        isQuotationProduct = json['IsQuotationProduct'],
        serviceDate = json['ServiceDate'],
        serviceDateTime = json['ServiceDateTime'],
        serviceTime = json['ServiceTime'],
        invoiceDetailsRequestModels = (json['InvoiceDetailsRequestModels'] as List?)?.map((dynamic e) => InvoiceDetailsRequestModels.fromJson(e as Map<String,dynamic>)).toList(),
        invoiceDetailsViewModels = json['InvoiceDetailsViewModels'] as List?;

  Map<String, dynamic> toJson() => {
    'InvoiceId' : invoiceId,
    'InvoiceMasterId' : invoiceMasterId,
    'RefNumber' : refNumber,
    'InvoiceDate' : invoiceDate,
    'TotalAmount' : totalAmount,
    'ReceivedAmt' : receivedAmt,
    'CarryingCost' : carryingCost,
    'CourierCharge' : courierCharge,
    'PaymentMethod' : paymentMethod,
    'PaymentStatus' : paymentStatus,
    'Remark' : remark,
    'DiscountCode' : discountCode,
    'DiscountValue' : discountValue,
    'StoreId' : storeId,
    'Status' : status,
    'CreatedAt' : createdAt,
    'SupplierId' : supplierId,
    'InvoiceStatusId' : invoiceStatusId,
    'AmountToSupplier' : amountToSupplier,
    'AmountToAdmin' : amountToAdmin,
    'SupplierCommissionId' : supplierCommissionId,
    'IsService' : isService,
    'IsDigitalProduct' : isDigitalProduct,
    'IsQuotationProduct' : isQuotationProduct,
    'ServiceDate' : serviceDate,
    'ServiceDateTime' : serviceDateTime,
    'ServiceTime' : serviceTime,
    'InvoiceDetailsRequestModels' : invoiceDetailsRequestModels?.map((e) => e.toJson()).toList(),
    'InvoiceDetailsViewModels' : invoiceDetailsViewModels
  };
}

class InvoiceDetailsRequestModels {
  final int? invoiceDetailsId;
  final int? invoiceId;
  final int? productMasterId;
  final int? quantity;
  final double? price;
  final dynamic status;
  final dynamic createdAt;
  final int? productSubSKUId;

  InvoiceDetailsRequestModels({
    this.invoiceDetailsId,
    this.invoiceId,
    this.productMasterId,
    this.quantity,
    this.price,
    this.status,
    this.createdAt,
    this.productSubSKUId,
  });

  InvoiceDetailsRequestModels.fromJson(Map<String, dynamic> json)
      : invoiceDetailsId = json['InvoiceDetailsId'] as int?,
        invoiceId = json['InvoiceId'] as int?,
        productMasterId = json['ProductMasterId'] as int?,
        quantity = json['Quantity'] as int?,
        price = json['Price'] as double?,
        status = json['Status'],
        createdAt = json['CreatedAt'],
        productSubSKUId = json['ProductSubSKUId'] as int?;

  Map<String, dynamic> toJson() => {
    'InvoiceDetailsId' : invoiceDetailsId,
    'InvoiceId' : invoiceId,
    'ProductMasterId' : productMasterId,
    'Quantity' : quantity,
    'Price' : price,
    'Status' : status,
    'CreatedAt' : createdAt,
    'ProductSubSKUId' : productSubSKUId
  };
}

class PaymentRequestModels {
  final int? paymentId;
  final dynamic invoiceMasterId;
  final int? currencyId;
  final double? amount;
  final int? courierCharge;
  final dynamic discountAmount;
  final int? carryingCost;
  final int? paymentMethod;
  final dynamic courierAgencyId;
  final String? payDate;
  final dynamic note;
  final dynamic transactionNo;
  final dynamic status;
  final dynamic createdAt;
  final dynamic couponId;

  PaymentRequestModels({
    this.paymentId,
    this.invoiceMasterId,
    this.currencyId,
    this.amount,
    this.courierCharge,
    this.discountAmount,
    this.carryingCost,
    this.paymentMethod,
    this.courierAgencyId,
    this.payDate,
    this.note,
    this.transactionNo,
    this.status,
    this.createdAt,
    this.couponId,
  });

  PaymentRequestModels.fromJson(Map<String, dynamic> json)
      : paymentId = json['PaymentId'] as int?,
        invoiceMasterId = json['InvoiceMasterId'],
        currencyId = json['CurrencyId'] as int?,
        amount = json['Amount'] as double?,
        courierCharge = json['CourierCharge'] as int?,
        discountAmount = json['DiscountAmount'],
        carryingCost = json['CarryingCost'] as int?,
        paymentMethod = json['PaymentMethod'] as int?,
        courierAgencyId = json['CourierAgencyId'],
        payDate = json['PayDate'] as String?,
        note = json['Note'],
        transactionNo = json['TransactionNo'],
        status = json['Status'],
        createdAt = json['CreatedAt'],
        couponId = json['CouponId'];

  Map<String, dynamic> toJson() => {
    'PaymentId' : paymentId,
    'InvoiceMasterId' : invoiceMasterId,
    'CurrencyId' : currencyId,
    'Amount' : amount,
    'CourierCharge' : courierCharge,
    'DiscountAmount' : discountAmount,
    'CarryingCost' : carryingCost,
    'PaymentMethod' : paymentMethod,
    'CourierAgencyId' : courierAgencyId,
    'PayDate' : payDate,
    'Note' : note,
    'TransactionNo' : transactionNo,
    'Status' : status,
    'CreatedAt' : createdAt,
    'CouponId' : couponId
  };
}

class BillingShippingAddressRequestModels {
  final int? billingShippingAddressId;
  final dynamic invoiceMasterId;
  final int? customerId;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final String? name;
  final String? addressLine;
  final dynamic addressLine2;
  final dynamic landMark;
  final dynamic deleveryNote;
  final dynamic status;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic zipCode;
  final dynamic phoneNumber;
  final dynamic isDefault;
  final dynamic latitued;
  final dynamic longitued;
  final dynamic deleveryTime;
  final bool? isBilingAddress;
  final bool? isShippingAddress;
  final int? customerAddressId;

  BillingShippingAddressRequestModels({
    this.billingShippingAddressId,
    this.invoiceMasterId,
    this.customerId,
    this.countryId,
    this.stateId,
    this.cityId,
    this.name,
    this.addressLine,
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
    this.isBilingAddress,
    this.isShippingAddress,
    this.customerAddressId,
  });

  BillingShippingAddressRequestModels.fromJson(Map<String, dynamic> json)
      : billingShippingAddressId = json['BillingShippingAddressId'] as int?,
        invoiceMasterId = json['InvoiceMasterId'],
        customerId = json['CustomerId'] as int?,
        countryId = json['CountryId'] as int?,
        stateId = json['StateId'] as int?,
        cityId = json['CityId'] as int?,
        name = json['Name'] as String?,
        addressLine = json['AddressLine'] as String?,
        addressLine2 = json['AddressLine2'],
        landMark = json['LandMark'],
        deleveryNote = json['DeleveryNote'],
        status = json['Status'],
        createdAt = json['CreatedAt'],
        updatedAt = json['UpdatedAt'],
        zipCode = json['ZipCode'],
        phoneNumber = json['PhoneNumber'],
        isDefault = json['IsDefault'],
        latitued = json['Latitued'],
        longitued = json['Longitued'],
        deleveryTime = json['DeleveryTime'],
        isBilingAddress = json['IsBilingAddress'] as bool?,
        isShippingAddress = json['IsShippingAddress'] as bool?,
        customerAddressId = json['CustomerAddressId'] as int?;

  Map<String, dynamic> toJson() => {
    'BillingShippingAddressId' : billingShippingAddressId,
    'InvoiceMasterId' : invoiceMasterId,
    'CustomerId' : customerId,
    'CountryId' : countryId,
    'StateId' : stateId,
    'CityId' : cityId,
    'Name' : name,
    'AddressLine' : addressLine,
    'AddressLine2' : addressLine2,
    'LandMark' : landMark,
    'DeleveryNote' : deleveryNote,
    'Status' : status,
    'CreatedAt' : createdAt,
    'UpdatedAt' : updatedAt,
    'ZipCode' : zipCode,
    'PhoneNumber' : phoneNumber,
    'IsDefault' : isDefault,
    'Latitued' : latitued,
    'Longitued' : longitued,
    'DeleveryTime' : deleveryTime,
    'IsBilingAddress' : isBilingAddress,
    'IsShippingAddress' : isShippingAddress,
    'CustomerAddressId' : customerAddressId
  };
}