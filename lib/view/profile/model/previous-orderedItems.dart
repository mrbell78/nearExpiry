class PreviousOrderedItems {
  final int? invoiceMasterId;
  final int? customerId;
  final String? refNumber;
  final String? invoiceDate;
  final double? totalAmount;
  final double? receivedAmt;
  final double? courierCharge;
  final double? carryingCost;
  final int? paymentMethod;
  final String? remark;
  final String? discountCode;
  final double? discountValue;
  final int? paymentStatus;
  final String? status;
  final dynamic currency;
  final String? createdAt;
  final dynamic countryId;
  final dynamic stateId;
  final dynamic cityId;
  final dynamic driverId;
  final int? totalRecords;
  final BillingAddressViewModels? billingAddressViewModels;
  final ShippingAddressViewModels? shippingAddressViewModels;
  final List<InvoiceViewModels>? invoiceViewModels;
  final List<StatusLogViewModels>? statusLogViewModels;
  final List<PaymentViewModels>? paymentViewModels;
  final CustomerViewModel? customerViewModel;
  final List<dynamic>? invoiceDetailsViewModels;
  final CountryViewModel? countryViewModel;
  final StateViewModel? stateViewModel;
  final CityViewModel? cityViewModel;
  final CompanyProfileViewModel? companyProfileViewModel;
  final List<dynamic>? invoiceInputFieldValueViewModel;

  PreviousOrderedItems({
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
    this.currency,
    this.createdAt,
    this.countryId,
    this.stateId,
    this.cityId,
    this.driverId,
    this.totalRecords,
    this.billingAddressViewModels,
    this.shippingAddressViewModels,
    this.invoiceViewModels,
    this.statusLogViewModels,
    this.paymentViewModels,
    this.customerViewModel,
    this.invoiceDetailsViewModels,
    this.countryViewModel,
    this.stateViewModel,
    this.cityViewModel,
    this.companyProfileViewModel,
    this.invoiceInputFieldValueViewModel,
  });

  PreviousOrderedItems.fromJson(Map<String, dynamic> json)
      : invoiceMasterId = json['invoiceMasterId'] as int?,
        customerId = json['customerId'] as int?,
        refNumber = json['refNumber'] as String?,
        invoiceDate = json['invoiceDate'] as String?,
        totalAmount = json['totalAmount'] as double?,
        receivedAmt = json['receivedAmt'] as double?,
        courierCharge = json['courierCharge'] as double?,
        carryingCost = json['carryingCost'] as double?,
        paymentMethod = json['paymentMethod'] as int?,
        remark = json['remark'] as String?,
        discountCode = json['discountCode'] as String?,
        discountValue = json['discountValue'] as double?,
        paymentStatus = json['paymentStatus'] as int?,
        status = json['status'] as String?,
        currency = json['currency'],
        createdAt = json['createdAt'] as String?,
        countryId = json['countryId'],
        stateId = json['stateId'],
        cityId = json['cityId'],
        driverId = json['driverId'],
        totalRecords = json['totalRecords'] as int?,
        billingAddressViewModels = (json['billingAddressViewModels'] as Map<String,dynamic>?) != null ? BillingAddressViewModels.fromJson(json['billingAddressViewModels'] as Map<String,dynamic>) : null,
        shippingAddressViewModels = (json['shippingAddressViewModels'] as Map<String,dynamic>?) != null ? ShippingAddressViewModels.fromJson(json['shippingAddressViewModels'] as Map<String,dynamic>) : null,
        invoiceViewModels = (json['invoiceViewModels'] as List?)?.map((dynamic e) => InvoiceViewModels.fromJson(e as Map<String,dynamic>)).toList(),
        statusLogViewModels = (json['statusLogViewModels'] as List?)?.map((dynamic e) => StatusLogViewModels.fromJson(e as Map<String,dynamic>)).toList(),
        paymentViewModels = (json['paymentViewModels'] as List?)?.map((dynamic e) => PaymentViewModels.fromJson(e as Map<String,dynamic>)).toList(),
        customerViewModel = (json['customerViewModel'] as Map<String,dynamic>?) != null ? CustomerViewModel.fromJson(json['customerViewModel'] as Map<String,dynamic>) : null,
        invoiceDetailsViewModels = json['invoiceDetailsViewModels'] as List?,
        countryViewModel = (json['countryViewModel'] as Map<String,dynamic>?) != null ? CountryViewModel.fromJson(json['countryViewModel'] as Map<String,dynamic>) : null,
        stateViewModel = (json['stateViewModel'] as Map<String,dynamic>?) != null ? StateViewModel.fromJson(json['stateViewModel'] as Map<String,dynamic>) : null,
        cityViewModel = (json['cityViewModel'] as Map<String,dynamic>?) != null ? CityViewModel.fromJson(json['cityViewModel'] as Map<String,dynamic>) : null,
        companyProfileViewModel = (json['companyProfileViewModel'] as Map<String,dynamic>?) != null ? CompanyProfileViewModel.fromJson(json['companyProfileViewModel'] as Map<String,dynamic>) : null,
        invoiceInputFieldValueViewModel = json['invoiceInputFieldValueViewModel'] as List?;

  Map<String, dynamic> toJson() => {
    'invoiceMasterId' : invoiceMasterId,
    'customerId' : customerId,
    'refNumber' : refNumber,
    'invoiceDate' : invoiceDate,
    'totalAmount' : totalAmount,
    'receivedAmt' : receivedAmt,
    'courierCharge' : courierCharge,
    'carryingCost' : carryingCost,
    'paymentMethod' : paymentMethod,
    'remark' : remark,
    'discountCode' : discountCode,
    'discountValue' : discountValue,
    'paymentStatus' : paymentStatus,
    'status' : status,
    'currency' : currency,
    'createdAt' : createdAt,
    'countryId' : countryId,
    'stateId' : stateId,
    'cityId' : cityId,
    'driverId' : driverId,
    'totalRecords' : totalRecords,
    'billingAddressViewModels' : billingAddressViewModels?.toJson(),
    'shippingAddressViewModels' : shippingAddressViewModels?.toJson(),
    'invoiceViewModels' : invoiceViewModels?.map((e) => e.toJson()).toList(),
    'statusLogViewModels' : statusLogViewModels?.map((e) => e.toJson()).toList(),
    'paymentViewModels' : paymentViewModels?.map((e) => e.toJson()).toList(),
    'customerViewModel' : customerViewModel?.toJson(),
    'invoiceDetailsViewModels' : invoiceDetailsViewModels,
    'countryViewModel' : countryViewModel?.toJson(),
    'stateViewModel' : stateViewModel?.toJson(),
    'cityViewModel' : cityViewModel?.toJson(),
    'companyProfileViewModel' : companyProfileViewModel?.toJson(),
    'invoiceInputFieldValueViewModel' : invoiceInputFieldValueViewModel
  };
}

class BillingAddressViewModels {
  final int? billingShippingAddressId;
  final int? invoiceMasterId;
  final int? customerId;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final String? name;
  final String? stateName;
  final dynamic cityName;
  final String? countryName;
  final String? addressLine;
  final String? addressLine2;
  final String? zipCode;
  final String? phoneNumber;
  final String? landMark;
  final String? deleveryNote;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final bool? isDefault;
  final String? latitued;
  final String? longitued;
  final String? deleveryTime;
  final bool? isBilingAddress;
  final bool? isShippingAddress;

  BillingAddressViewModels({
    this.billingShippingAddressId,
    this.invoiceMasterId,
    this.customerId,
    this.countryId,
    this.stateId,
    this.cityId,
    this.name,
    this.stateName,
    this.cityName,
    this.countryName,
    this.addressLine,
    this.addressLine2,
    this.zipCode,
    this.phoneNumber,
    this.landMark,
    this.deleveryNote,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isDefault,
    this.latitued,
    this.longitued,
    this.deleveryTime,
    this.isBilingAddress,
    this.isShippingAddress,
  });

  BillingAddressViewModels.fromJson(Map<String, dynamic> json)
      : billingShippingAddressId = json['billingShippingAddressId'] as int?,
        invoiceMasterId = json['invoiceMasterId'] as int?,
        customerId = json['customerId'] as int?,
        countryId = json['countryId'] as int?,
        stateId = json['stateId'] as int?,
        cityId = json['cityId'] as int?,
        name = json['name'] as String?,
        stateName = json['stateName'] as String?,
        cityName = json['cityName'],
        countryName = json['countryName'] as String?,
        addressLine = json['addressLine'] as String?,
        addressLine2 = json['addressLine2'] as String?,
        zipCode = json['zipCode'] as String?,
        phoneNumber = json['phoneNumber'] as String?,
        landMark = json['landMark'] as String?,
        deleveryNote = json['deleveryNote'] as String?,
        status = json['status'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        isDefault = json['isDefault'] as bool?,
        latitued = json['latitued'] as String?,
        longitued = json['longitued'] as String?,
        deleveryTime = json['deleveryTime'] as String?,
        isBilingAddress = json['isBilingAddress'] as bool?,
        isShippingAddress = json['isShippingAddress'] as bool?;

  Map<String, dynamic> toJson() => {
    'billingShippingAddressId' : billingShippingAddressId,
    'invoiceMasterId' : invoiceMasterId,
    'customerId' : customerId,
    'countryId' : countryId,
    'stateId' : stateId,
    'cityId' : cityId,
    'name' : name,
    'stateName' : stateName,
    'cityName' : cityName,
    'countryName' : countryName,
    'addressLine' : addressLine,
    'addressLine2' : addressLine2,
    'zipCode' : zipCode,
    'phoneNumber' : phoneNumber,
    'landMark' : landMark,
    'deleveryNote' : deleveryNote,
    'status' : status,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    'isDefault' : isDefault,
    'latitued' : latitued,
    'longitued' : longitued,
    'deleveryTime' : deleveryTime,
    'isBilingAddress' : isBilingAddress,
    'isShippingAddress' : isShippingAddress
  };
}

class ShippingAddressViewModels {
  final int? billingShippingAddressId;
  final int? invoiceMasterId;
  final int? customerId;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final String? name;
  final String? stateName;
  final String? cityName;
  final String? countryName;
  final String? addressLine;
  final String? addressLine2;
  final String? zipCode;
  final String? phoneNumber;
  final String? landMark;
  final String? deleveryNote;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final bool? isDefault;
  final String? latitued;
  final String? longitued;
  final String? deleveryTime;
  final bool? isBilingAddress;
  final bool? isShippingAddress;

  ShippingAddressViewModels({
    this.billingShippingAddressId,
    this.invoiceMasterId,
    this.customerId,
    this.countryId,
    this.stateId,
    this.cityId,
    this.name,
    this.stateName,
    this.cityName,
    this.countryName,
    this.addressLine,
    this.addressLine2,
    this.zipCode,
    this.phoneNumber,
    this.landMark,
    this.deleveryNote,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isDefault,
    this.latitued,
    this.longitued,
    this.deleveryTime,
    this.isBilingAddress,
    this.isShippingAddress,
  });

  ShippingAddressViewModels.fromJson(Map<String, dynamic> json)
      : billingShippingAddressId = json['billingShippingAddressId'] as int?,
        invoiceMasterId = json['invoiceMasterId'] as int?,
        customerId = json['customerId'] as int?,
        countryId = json['countryId'] as int?,
        stateId = json['stateId'] as int?,
        cityId = json['cityId'] as int?,
        name = json['name'] as String?,
        stateName = json['stateName'] as String?,
        cityName = json['cityName'] as String?,
        countryName = json['countryName'] as String?,
        addressLine = json['addressLine'] as String?,
        addressLine2 = json['addressLine2'] as String?,
        zipCode = json['zipCode'] as String?,
        phoneNumber = json['phoneNumber'] as String?,
        landMark = json['landMark'] as String?,
        deleveryNote = json['deleveryNote'] as String?,
        status = json['status'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        isDefault = json['isDefault'] as bool?,
        latitued = json['latitued'] as String?,
        longitued = json['longitued'] as String?,
        deleveryTime = json['deleveryTime'] as String?,
        isBilingAddress = json['isBilingAddress'] as bool?,
        isShippingAddress = json['isShippingAddress'] as bool?;

  Map<String, dynamic> toJson() => {
    'billingShippingAddressId' : billingShippingAddressId,
    'invoiceMasterId' : invoiceMasterId,
    'customerId' : customerId,
    'countryId' : countryId,
    'stateId' : stateId,
    'cityId' : cityId,
    'name' : name,
    'stateName' : stateName,
    'cityName' : cityName,
    'countryName' : countryName,
    'addressLine' : addressLine,
    'addressLine2' : addressLine2,
    'zipCode' : zipCode,
    'phoneNumber' : phoneNumber,
    'landMark' : landMark,
    'deleveryNote' : deleveryNote,
    'status' : status,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    'isDefault' : isDefault,
    'latitued' : latitued,
    'longitued' : longitued,
    'deleveryTime' : deleveryTime,
    'isBilingAddress' : isBilingAddress,
    'isShippingAddress' : isShippingAddress
  };
}

class InvoiceViewModels {
  final int? invoiceId;
  final int? invoiceMasterId;
  final String? refNumber;
  final String? invoiceDate;
  final double? totalAmount;
  final double? receivedAmt;
  final double? carryingCost;
  final double? courierCharge;
  final int? paymentMethod;
  final int? paymentStatus;
  final dynamic supplierId;
  final String? remark;
  final String? discountCode;
  final double? discountValue;
  final int? storeId;
  final String? status;
  final dynamic createdAt;
  final int? invoiceStatusId;
  final double? amountToSupplier;
  final double? amountToAdmin;
  final int? supplierCommissionId;
  final dynamic methodName;
  final dynamic isService;
  final dynamic serviceDate;
  final dynamic supplierName;
  final StoreViewModel? storeViewModel;
  final InvoiceStatusViewModel? invoiceStatusViewModel;

  InvoiceViewModels({
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
    this.supplierId,
    this.remark,
    this.discountCode,
    this.discountValue,
    this.storeId,
    this.status,
    this.createdAt,
    this.invoiceStatusId,
    this.amountToSupplier,
    this.amountToAdmin,
    this.supplierCommissionId,
    this.methodName,
    this.isService,
    this.serviceDate,
    this.supplierName,
    this.storeViewModel,
    this.invoiceStatusViewModel,
  });

  InvoiceViewModels.fromJson(Map<String, dynamic> json)
      : invoiceId = json['invoiceId'] as int?,
        invoiceMasterId = json['invoiceMasterId'] as int?,
        refNumber = json['refNumber'] as String?,
        invoiceDate = json['invoiceDate'] as String?,
        totalAmount = json['totalAmount'] as double?,
        receivedAmt = json['receivedAmt'] as double?,
        carryingCost = json['carryingCost'] as double?,
        courierCharge = json['courierCharge'] as double?,
        paymentMethod = json['paymentMethod'] as int?,
        paymentStatus = json['paymentStatus'] as int?,
        supplierId = json['supplierId'],
        remark = json['remark'] as String?,
        discountCode = json['discountCode'] as String?,
        discountValue = json['discountValue'] as double?,
        storeId = json['storeId'] as int?,
        status = json['status'] as String?,
        createdAt = json['createdAt'],
        invoiceStatusId = json['invoiceStatusId'] as int?,
        amountToSupplier = json['amountToSupplier'] as double?,
        amountToAdmin = json['amountToAdmin'] as double?,
        supplierCommissionId = json['supplierCommissionId'] as int?,
        methodName = json['methodName'],
        isService = json['isService'],
        serviceDate = json['serviceDate'],
        supplierName = json['supplierName'],
        storeViewModel = (json['storeViewModel'] as Map<String,dynamic>?) != null ? StoreViewModel.fromJson(json['storeViewModel'] as Map<String,dynamic>) : null,
        invoiceStatusViewModel = (json['invoiceStatusViewModel'] as Map<String,dynamic>?) != null ? InvoiceStatusViewModel.fromJson(json['invoiceStatusViewModel'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'invoiceId' : invoiceId,
    'invoiceMasterId' : invoiceMasterId,
    'refNumber' : refNumber,
    'invoiceDate' : invoiceDate,
    'totalAmount' : totalAmount,
    'receivedAmt' : receivedAmt,
    'carryingCost' : carryingCost,
    'courierCharge' : courierCharge,
    'paymentMethod' : paymentMethod,
    'paymentStatus' : paymentStatus,
    'supplierId' : supplierId,
    'remark' : remark,
    'discountCode' : discountCode,
    'discountValue' : discountValue,
    'storeId' : storeId,
    'status' : status,
    'createdAt' : createdAt,
    'invoiceStatusId' : invoiceStatusId,
    'amountToSupplier' : amountToSupplier,
    'amountToAdmin' : amountToAdmin,
    'supplierCommissionId' : supplierCommissionId,
    'methodName' : methodName,
    'isService' : isService,
    'serviceDate' : serviceDate,
    'supplierName' : supplierName,
    'storeViewModel' : storeViewModel?.toJson(),
    'invoiceStatusViewModel' : invoiceStatusViewModel?.toJson()
  };
}

class StoreViewModel {
  final int? storeId;
  final dynamic supplierId;
  final String? shopName;
  final dynamic mobile;
  final dynamic landPhone;
  final dynamic email;
  final dynamic address;
  final dynamic largeImage;
  final dynamic mediumImage;
  final dynamic smallImage;
  final dynamic parentId;
  final int? parentStoreId;
  final dynamic latitued;
  final dynamic longitued;
  final dynamic description;
  final dynamic countryId;
  final dynamic stateId;
  final dynamic cityId;
  final dynamic status;
  final String? createdAt;
  final dynamic updatedAt;
  final dynamic guidId;
  final dynamic currencyId;
  final dynamic countryName;
  final dynamic mapUrl;
  final int? manualStoreId;
  final int? manualParentStoreId;
  final dynamic supplierName;
  final bool? isManagedWareHouse;
  final List<dynamic>? breadcrumb;
  final List<dynamic>? childStores;
  final List<dynamic>? storeOperationViewModels;
  final dynamic storeSummaryViewModels;
  final List<dynamic>? storeParentViewModels;

  StoreViewModel({
    this.storeId,
    this.supplierId,
    this.shopName,
    this.mobile,
    this.landPhone,
    this.email,
    this.address,
    this.largeImage,
    this.mediumImage,
    this.smallImage,
    this.parentId,
    this.parentStoreId,
    this.latitued,
    this.longitued,
    this.description,
    this.countryId,
    this.stateId,
    this.cityId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.guidId,
    this.currencyId,
    this.countryName,
    this.mapUrl,
    this.manualStoreId,
    this.manualParentStoreId,
    this.supplierName,
    this.isManagedWareHouse,
    this.breadcrumb,
    this.childStores,
    this.storeOperationViewModels,
    this.storeSummaryViewModels,
    this.storeParentViewModels,
  });

  StoreViewModel.fromJson(Map<String, dynamic> json)
      : storeId = json['storeId'] as int?,
        supplierId = json['supplierId'],
        shopName = json['shopName'] as String?,
        mobile = json['mobile'],
        landPhone = json['landPhone'],
        email = json['email'],
        address = json['address'],
        largeImage = json['largeImage'],
        mediumImage = json['mediumImage'],
        smallImage = json['smallImage'],
        parentId = json['parentId'],
        parentStoreId = json['parentStoreId'] as int?,
        latitued = json['latitued'],
        longitued = json['longitued'],
        description = json['description'],
        countryId = json['countryId'],
        stateId = json['stateId'],
        cityId = json['cityId'],
        status = json['status'],
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'],
        guidId = json['guidId'],
        currencyId = json['currencyId'],
        countryName = json['countryName'],
        mapUrl = json['mapUrl'],
        manualStoreId = json['manualStoreId'] as int?,
        manualParentStoreId = json['manualParentStoreId'] as int?,
        supplierName = json['supplierName'],
        isManagedWareHouse = json['isManagedWareHouse'] as bool?,
        breadcrumb = json['breadcrumb'] as List?,
        childStores = json['childStores'] as List?,
        storeOperationViewModels = json['storeOperationViewModels'] as List?,
        storeSummaryViewModels = json['storeSummaryViewModels'],
        storeParentViewModels = json['storeParentViewModels'] as List?;

  Map<String, dynamic> toJson() => {
    'storeId' : storeId,
    'supplierId' : supplierId,
    'shopName' : shopName,
    'mobile' : mobile,
    'landPhone' : landPhone,
    'email' : email,
    'address' : address,
    'largeImage' : largeImage,
    'mediumImage' : mediumImage,
    'smallImage' : smallImage,
    'parentId' : parentId,
    'parentStoreId' : parentStoreId,
    'latitued' : latitued,
    'longitued' : longitued,
    'description' : description,
    'countryId' : countryId,
    'stateId' : stateId,
    'cityId' : cityId,
    'status' : status,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    'guidId' : guidId,
    'currencyId' : currencyId,
    'countryName' : countryName,
    'mapUrl' : mapUrl,
    'manualStoreId' : manualStoreId,
    'manualParentStoreId' : manualParentStoreId,
    'supplierName' : supplierName,
    'isManagedWareHouse' : isManagedWareHouse,
    'breadcrumb' : breadcrumb,
    'childStores' : childStores,
    'storeOperationViewModels' : storeOperationViewModels,
    'storeSummaryViewModels' : storeSummaryViewModels,
    'storeParentViewModels' : storeParentViewModels
  };
}

class InvoiceStatusViewModel {
  final int? invoiceStatusId;
  final String? name;
  final bool? active;
  final String? createDate;
  final dynamic isPublic;
  final dynamic isInternal;
  final dynamic isDelete;
  final int? label;
  final dynamic settingName;
  final int? invoiceStatusSettingId;
  final dynamic isService;
  final dynamic isEmail;
  final dynamic isSmS;
  final dynamic isPushNotification;
  final dynamic isCustomer;
  final dynamic isAdmin;
  final dynamic smSTemplateId;
  final dynamic smSTemplateTitle;
  final dynamic emailTemplateId;
  final dynamic emailTemplateTitle;
  final dynamic pushNotificationId;
  final dynamic pushNotificationTitle;

  InvoiceStatusViewModel({
    this.invoiceStatusId,
    this.name,
    this.active,
    this.createDate,
    this.isPublic,
    this.isInternal,
    this.isDelete,
    this.label,
    this.settingName,
    this.invoiceStatusSettingId,
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

  InvoiceStatusViewModel.fromJson(Map<String, dynamic> json)
      : invoiceStatusId = json['invoiceStatusId'] as int?,
        name = json['name'] as String?,
        active = json['active'] as bool?,
        createDate = json['createDate'] as String?,
        isPublic = json['isPublic'],
        isInternal = json['isInternal'],
        isDelete = json['isDelete'],
        label = json['label'] as int?,
        settingName = json['settingName'],
        invoiceStatusSettingId = json['invoiceStatusSettingId'] as int?,
        isService = json['isService'],
        isEmail = json['isEmail'],
        isSmS = json['isSmS'],
        isPushNotification = json['isPushNotification'],
        isCustomer = json['isCustomer'],
        isAdmin = json['isAdmin'],
        smSTemplateId = json['smSTemplateId'],
        smSTemplateTitle = json['smSTemplateTitle'],
        emailTemplateId = json['emailTemplateId'],
        emailTemplateTitle = json['emailTemplateTitle'],
        pushNotificationId = json['pushNotificationId'],
        pushNotificationTitle = json['pushNotificationTitle'];

  Map<String, dynamic> toJson() => {
    'invoiceStatusId' : invoiceStatusId,
    'name' : name,
    'active' : active,
    'createDate' : createDate,
    'isPublic' : isPublic,
    'isInternal' : isInternal,
    'isDelete' : isDelete,
    'label' : label,
    'settingName' : settingName,
    'invoiceStatusSettingId' : invoiceStatusSettingId,
    'isService' : isService,
    'isEmail' : isEmail,
    'isSmS' : isSmS,
    'isPushNotification' : isPushNotification,
    'isCustomer' : isCustomer,
    'isAdmin' : isAdmin,
    'smSTemplateId' : smSTemplateId,
    'smSTemplateTitle' : smSTemplateTitle,
    'emailTemplateId' : emailTemplateId,
    'emailTemplateTitle' : emailTemplateTitle,
    'pushNotificationId' : pushNotificationId,
    'pushNotificationTitle' : pushNotificationTitle
  };
}

class StatusLogViewModels {
  final int? statusLogId;
  final int? invoiceId;
  final int? currentInvoiceStatusId;
  final int? nextInvoiceStatusId;
  final String? dateTime;
  final String? duration;
  final dynamic note;
  final dynamic createBy;
  final String? currentInvoiceStatus;
  final String? previousInvoiceStatus;
  final dynamic durationTime;

  StatusLogViewModels({
    this.statusLogId,
    this.invoiceId,
    this.currentInvoiceStatusId,
    this.nextInvoiceStatusId,
    this.dateTime,
    this.duration,
    this.note,
    this.createBy,
    this.currentInvoiceStatus,
    this.previousInvoiceStatus,
    this.durationTime,
  });

  StatusLogViewModels.fromJson(Map<String, dynamic> json)
      : statusLogId = json['statusLogId'] as int?,
        invoiceId = json['invoiceId'] as int?,
        currentInvoiceStatusId = json['currentInvoiceStatusId'] as int?,
        nextInvoiceStatusId = json['nextInvoiceStatusId'] as int?,
        dateTime = json['dateTime'] as String?,
        duration = json['duration'] as String?,
        note = json['note'],
        createBy = json['createBy'],
        currentInvoiceStatus = json['currentInvoiceStatus'] as String?,
        previousInvoiceStatus = json['previousInvoiceStatus'] as String?,
        durationTime = json['durationTime'];

  Map<String, dynamic> toJson() => {
    'statusLogId' : statusLogId,
    'invoiceId' : invoiceId,
    'currentInvoiceStatusId' : currentInvoiceStatusId,
    'nextInvoiceStatusId' : nextInvoiceStatusId,
    'dateTime' : dateTime,
    'duration' : duration,
    'note' : note,
    'createBy' : createBy,
    'currentInvoiceStatus' : currentInvoiceStatus,
    'previousInvoiceStatus' : previousInvoiceStatus,
    'durationTime' : durationTime
  };
}

class PaymentViewModels {
  final int? paymentId;
  final int? invoiceMasterId;
  final int? currencyId;
  final double? amount;
  final double? courierCharge;
  final double? discountAmount;
  final double? carryingCost;
  final int? paymentMethod;
  final dynamic courierAgencyId;
  final String? payDate;
  final String? note;
  final String? transactionNo;
  final String? status;
  final String? createdAt;
  final int? couponId;
  final dynamic currencyName;
  final dynamic symbol;
  final String? methodName;
  final String? statusName;
  final CurrencyViewModel? currencyViewModel;

  PaymentViewModels({
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
    this.currencyName,
    this.symbol,
    this.methodName,
    this.statusName,
    this.currencyViewModel,
  });

  PaymentViewModels.fromJson(Map<String, dynamic> json)
      : paymentId = json['paymentId'] as int?,
        invoiceMasterId = json['invoiceMasterId'] as int?,
        currencyId = json['currencyId'] as int?,
        amount = json['amount'] as double?,
        courierCharge = json['courierCharge'] as double?,
        discountAmount = json['discountAmount'] as double?,
        carryingCost = json['carryingCost'] as double?,
        paymentMethod = json['paymentMethod'] as int?,
        courierAgencyId = json['courierAgencyId'],
        payDate = json['payDate'] as String?,
        note = json['note'] as String?,
        transactionNo = json['transactionNo'] as String?,
        status = json['status'] as String?,
        createdAt = json['createdAt'] as String?,
        couponId = json['couponId'] as int?,
        currencyName = json['currencyName'],
        symbol = json['symbol'],
        methodName = json['methodName'] as String?,
        statusName = json['statusName'] as String?,
        currencyViewModel = (json['currencyViewModel'] as Map<String,dynamic>?) != null ? CurrencyViewModel.fromJson(json['currencyViewModel'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'paymentId' : paymentId,
    'invoiceMasterId' : invoiceMasterId,
    'currencyId' : currencyId,
    'amount' : amount,
    'courierCharge' : courierCharge,
    'discountAmount' : discountAmount,
    'carryingCost' : carryingCost,
    'paymentMethod' : paymentMethod,
    'courierAgencyId' : courierAgencyId,
    'payDate' : payDate,
    'note' : note,
    'transactionNo' : transactionNo,
    'status' : status,
    'createdAt' : createdAt,
    'couponId' : couponId,
    'currencyName' : currencyName,
    'symbol' : symbol,
    'methodName' : methodName,
    'statusName' : statusName,
    'currencyViewModel' : currencyViewModel?.toJson()
  };
}

class CurrencyViewModel {
  final int? currencyId;
  final dynamic name;
  final String? code;
  final String? symbol;
  final dynamic isDelete;
  final dynamic isBaseCurrency;
  final int? convertionRate;
  final dynamic convertionPrice;
  final dynamic createDate;

  CurrencyViewModel({
    this.currencyId,
    this.name,
    this.code,
    this.symbol,
    this.isDelete,
    this.isBaseCurrency,
    this.convertionRate,
    this.convertionPrice,
    this.createDate,
  });

  CurrencyViewModel.fromJson(Map<String, dynamic> json)
      : currencyId = json['currencyId'] as int?,
        name = json['name'],
        code = json['code'] as String?,
        symbol = json['symbol'] as String?,
        isDelete = json['isDelete'],
        isBaseCurrency = json['isBaseCurrency'],
        convertionRate = json['convertionRate'] as int?,
        convertionPrice = json['convertionPrice'],
        createDate = json['createDate'];

  Map<String, dynamic> toJson() => {
    'currencyId' : currencyId,
    'name' : name,
    'code' : code,
    'symbol' : symbol,
    'isDelete' : isDelete,
    'isBaseCurrency' : isBaseCurrency,
    'convertionRate' : convertionRate,
    'convertionPrice' : convertionPrice,
    'createDate' : createDate
  };
}

class CustomerViewModel {
  final int? customerId;
  final dynamic userName;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? email;
  final dynamic email2;
  final dynamic phoneNo;
  final dynamic phoneNo2;
  final dynamic phoneNo3;
  final int? gender;
  final dynamic dateOfBirth;
  final dynamic points;
  final dynamic pointInValue;
  final dynamic ratings;
  final dynamic totalOrders;
  final dynamic isBlacklisted;
  final dynamic isCorporate;
  final dynamic isNewsletterSub;
  final dynamic isReviewEnable;
  final dynamic isUpdatePassword;
  final dynamic isUpdateAddress;
  final String? password;
  final dynamic accountType;
  final dynamic customerTypeId;
  final dynamic token;
  final dynamic status;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic isDeleted;
  final int? customerGroupId;
  final dynamic taxorVatNumber;
  final int? totalOrder;
  final dynamic walletBalance;
  final int? totalRecords;
  final dynamic image;
  final CustomerGroupViewModel? customerGroupViewModel;
  final List<CustomerAddressViewModels>? customerAddressViewModels;
  final CustomerAddressViewModel? customerAddressViewModel;
  final List<dynamic>? walletTransactionViewModels;
  final dynamic invoiceMasterViewModel;
  final List<dynamic>? invoiceMasterViewModels;
  final dynamic cartResponseModels;
  final String? firstLastName;

  CustomerViewModel({
    this.customerId,
    this.userName,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.email2,
    this.phoneNo,
    this.phoneNo2,
    this.phoneNo3,
    this.gender,
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
    this.password,
    this.accountType,
    this.customerTypeId,
    this.token,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.customerGroupId,
    this.taxorVatNumber,
    this.totalOrder,
    this.walletBalance,
    this.totalRecords,
    this.image,
    this.customerGroupViewModel,
    this.customerAddressViewModels,
    this.customerAddressViewModel,
    this.walletTransactionViewModels,
    this.invoiceMasterViewModel,
    this.invoiceMasterViewModels,
    this.cartResponseModels,
    this.firstLastName,
  });

  CustomerViewModel.fromJson(Map<String, dynamic> json)
      : customerId = json['customerId'] as int?,
        userName = json['userName'],
        firstName = json['firstName'] as String?,
        middleName = json['middleName'] as String?,
        lastName = json['lastName'] as String?,
        email = json['email'] as String?,
        email2 = json['email2'],
        phoneNo = json['phoneNo'],
        phoneNo2 = json['phoneNo2'],
        phoneNo3 = json['phoneNo3'],
        gender = json['gender'] as int?,
        dateOfBirth = json['dateOfBirth'],
        points = json['points'],
        pointInValue = json['pointInValue'],
        ratings = json['ratings'],
        totalOrders = json['totalOrders'],
        isBlacklisted = json['isBlacklisted'],
        isCorporate = json['isCorporate'],
        isNewsletterSub = json['isNewsletterSub'],
        isReviewEnable = json['isReviewEnable'],
        isUpdatePassword = json['isUpdatePassword'],
        isUpdateAddress = json['isUpdateAddress'],
        password = json['password'] as String?,
        accountType = json['accountType'],
        customerTypeId = json['customerTypeId'],
        token = json['token'],
        status = json['status'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        isDeleted = json['isDeleted'],
        customerGroupId = json['customerGroupId'] as int?,
        taxorVatNumber = json['taxorVatNumber'],
        totalOrder = json['totalOrder'] as int?,
        walletBalance = json['walletBalance'],
        totalRecords = json['totalRecords'] as int?,
        image = json['image'],
        customerGroupViewModel = (json['customerGroupViewModel'] as Map<String,dynamic>?) != null ? CustomerGroupViewModel.fromJson(json['customerGroupViewModel'] as Map<String,dynamic>) : null,
        customerAddressViewModels = (json['customerAddressViewModels'] as List?)?.map((dynamic e) => CustomerAddressViewModels.fromJson(e as Map<String,dynamic>)).toList(),
        customerAddressViewModel = (json['customerAddressViewModel'] as Map<String,dynamic>?) != null ? CustomerAddressViewModel.fromJson(json['customerAddressViewModel'] as Map<String,dynamic>) : null,
        walletTransactionViewModels = json['walletTransactionViewModels'] as List?,
        invoiceMasterViewModel = json['invoiceMasterViewModel'],
        invoiceMasterViewModels = json['invoiceMasterViewModels'] as List?,
        cartResponseModels = json['cartResponseModels'],
        firstLastName = json['firstLastName'] as String?;

  Map<String, dynamic> toJson() => {
    'customerId' : customerId,
    'userName' : userName,
    'firstName' : firstName,
    'middleName' : middleName,
    'lastName' : lastName,
    'email' : email,
    'email2' : email2,
    'phoneNo' : phoneNo,
    'phoneNo2' : phoneNo2,
    'phoneNo3' : phoneNo3,
    'gender' : gender,
    'dateOfBirth' : dateOfBirth,
    'points' : points,
    'pointInValue' : pointInValue,
    'ratings' : ratings,
    'totalOrders' : totalOrders,
    'isBlacklisted' : isBlacklisted,
    'isCorporate' : isCorporate,
    'isNewsletterSub' : isNewsletterSub,
    'isReviewEnable' : isReviewEnable,
    'isUpdatePassword' : isUpdatePassword,
    'isUpdateAddress' : isUpdateAddress,
    'password' : password,
    'accountType' : accountType,
    'customerTypeId' : customerTypeId,
    'token' : token,
    'status' : status,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    'isDeleted' : isDeleted,
    'customerGroupId' : customerGroupId,
    'taxorVatNumber' : taxorVatNumber,
    'totalOrder' : totalOrder,
    'walletBalance' : walletBalance,
    'totalRecords' : totalRecords,
    'image' : image,
    'customerGroupViewModel' : customerGroupViewModel?.toJson(),
    'customerAddressViewModels' : customerAddressViewModels?.map((e) => e.toJson()).toList(),
    'customerAddressViewModel' : customerAddressViewModel?.toJson(),
    'walletTransactionViewModels' : walletTransactionViewModels,
    'invoiceMasterViewModel' : invoiceMasterViewModel,
    'invoiceMasterViewModels' : invoiceMasterViewModels,
    'cartResponseModels' : cartResponseModels,
    'firstLastName' : firstLastName
  };
}

class CustomerGroupViewModel {
  final int? customerGroupId;
  final String? groupName;
  final dynamic taxClass;
  final dynamic isDeleted;
  final String? createdAt;
  final dynamic updatedAt;

  CustomerGroupViewModel({
    this.customerGroupId,
    this.groupName,
    this.taxClass,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  CustomerGroupViewModel.fromJson(Map<String, dynamic> json)
      : customerGroupId = json['customerGroupId'] as int?,
        groupName = json['groupName'] as String?,
        taxClass = json['taxClass'],
        isDeleted = json['isDeleted'],
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson() => {
    'customerGroupId' : customerGroupId,
    'groupName' : groupName,
    'taxClass' : taxClass,
    'isDeleted' : isDeleted,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt
  };
}

class CustomerAddressViewModels {
  final int? customerAddressId;
  final int? customerId;
  final String? addressType;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final String? address;
  final dynamic buildingName;
  final dynamic flatNo;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic nearByLocation;
  final bool? isDefault;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? countryName;
  final String? stateName;
  final String? cityName;
  final dynamic addressLine2;
  final dynamic zipCode;
  final dynamic phoneNumber;
  final dynamic customerViewModel;

  CustomerAddressViewModels({
    this.customerAddressId,
    this.customerId,
    this.addressType,
    this.countryId,
    this.stateId,
    this.cityId,
    this.address,
    this.buildingName,
    this.flatNo,
    this.latitude,
    this.longitude,
    this.nearByLocation,
    this.isDefault,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.countryName,
    this.stateName,
    this.cityName,
    this.addressLine2,
    this.zipCode,
    this.phoneNumber,
    this.customerViewModel,
  });

  CustomerAddressViewModels.fromJson(Map<String, dynamic> json)
      : customerAddressId = json['customerAddressId'] as int?,
        customerId = json['customerId'] as int?,
        addressType = json['addressType'] as String?,
        countryId = json['countryId'] as int?,
        stateId = json['stateId'] as int?,
        cityId = json['cityId'] as int?,
        address = json['address'] as String?,
        buildingName = json['buildingName'],
        flatNo = json['flatNo'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        nearByLocation = json['nearByLocation'],
        isDefault = json['isDefault'] as bool?,
        status = json['status'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        countryName = json['countryName'] as String?,
        stateName = json['stateName'] as String?,
        cityName = json['cityName'] as String?,
        addressLine2 = json['addressLine2'],
        zipCode = json['zipCode'],
        phoneNumber = json['phoneNumber'],
        customerViewModel = json['customerViewModel'];

  Map<String, dynamic> toJson() => {
    'customerAddressId' : customerAddressId,
    'customerId' : customerId,
    'addressType' : addressType,
    'countryId' : countryId,
    'stateId' : stateId,
    'cityId' : cityId,
    'address' : address,
    'buildingName' : buildingName,
    'flatNo' : flatNo,
    'latitude' : latitude,
    'longitude' : longitude,
    'nearByLocation' : nearByLocation,
    'isDefault' : isDefault,
    'status' : status,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    'countryName' : countryName,
    'stateName' : stateName,
    'cityName' : cityName,
    'addressLine2' : addressLine2,
    'zipCode' : zipCode,
    'phoneNumber' : phoneNumber,
    'customerViewModel' : customerViewModel
  };
}

class CustomerAddressViewModel {
  final int? customerAddressId;
  final int? customerId;
  final dynamic addressType;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final dynamic address;
  final dynamic buildingName;
  final dynamic flatNo;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic nearByLocation;
  final dynamic isDefault;
  final dynamic status;
  final String? createdAt;
  final dynamic updatedAt;
  final dynamic countryName;
  final dynamic stateName;
  final dynamic cityName;
  final dynamic addressLine2;
  final dynamic zipCode;
  final dynamic phoneNumber;
  final dynamic customerViewModel;

  CustomerAddressViewModel({
    this.customerAddressId,
    this.customerId,
    this.addressType,
    this.countryId,
    this.stateId,
    this.cityId,
    this.address,
    this.buildingName,
    this.flatNo,
    this.latitude,
    this.longitude,
    this.nearByLocation,
    this.isDefault,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.countryName,
    this.stateName,
    this.cityName,
    this.addressLine2,
    this.zipCode,
    this.phoneNumber,
    this.customerViewModel,
  });

  CustomerAddressViewModel.fromJson(Map<String, dynamic> json)
      : customerAddressId = json['customerAddressId'] as int?,
        customerId = json['customerId'] as int?,
        addressType = json['addressType'],
        countryId = json['countryId'] as int?,
        stateId = json['stateId'] as int?,
        cityId = json['cityId'] as int?,
        address = json['address'],
        buildingName = json['buildingName'],
        flatNo = json['flatNo'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        nearByLocation = json['nearByLocation'],
        isDefault = json['isDefault'],
        status = json['status'],
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'],
        countryName = json['countryName'],
        stateName = json['stateName'],
        cityName = json['cityName'],
        addressLine2 = json['addressLine2'],
        zipCode = json['zipCode'],
        phoneNumber = json['phoneNumber'],
        customerViewModel = json['customerViewModel'];

  Map<String, dynamic> toJson() => {
    'customerAddressId' : customerAddressId,
    'customerId' : customerId,
    'addressType' : addressType,
    'countryId' : countryId,
    'stateId' : stateId,
    'cityId' : cityId,
    'address' : address,
    'buildingName' : buildingName,
    'flatNo' : flatNo,
    'latitude' : latitude,
    'longitude' : longitude,
    'nearByLocation' : nearByLocation,
    'isDefault' : isDefault,
    'status' : status,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    'countryName' : countryName,
    'stateName' : stateName,
    'cityName' : cityName,
    'addressLine2' : addressLine2,
    'zipCode' : zipCode,
    'phoneNumber' : phoneNumber,
    'customerViewModel' : customerViewModel
  };
}

class CountryViewModel {
  final int? countryId;
  final dynamic iso;
  final dynamic countryName;
  final dynamic longCountryName;
  final dynamic iso3;
  final dynamic countryCode;
  final dynamic unMemberState;
  final dynamic callingCode;
  final dynamic ccTld;
  final dynamic status;
  final dynamic lastModified;
  final dynamic isDeleted;
  final dynamic guidId;
  final dynamic manualStoreId;
  final dynamic image;
  final List<dynamic>? countryWiseStoreViewModels;

  CountryViewModel({
    this.countryId,
    this.iso,
    this.countryName,
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
    this.countryWiseStoreViewModels,
  });

  CountryViewModel.fromJson(Map<String, dynamic> json)
      : countryId = json['countryId'] as int?,
        iso = json['iso'],
        countryName = json['countryName'],
        longCountryName = json['longCountryName'],
        iso3 = json['iso3'],
        countryCode = json['countryCode'],
        unMemberState = json['unMemberState'],
        callingCode = json['callingCode'],
        ccTld = json['ccTld'],
        status = json['status'],
        lastModified = json['lastModified'],
        isDeleted = json['isDeleted'],
        guidId = json['guidId'],
        manualStoreId = json['manualStoreId'],
        image = json['image'],
        countryWiseStoreViewModels = json['countryWiseStoreViewModels'] as List?;

  Map<String, dynamic> toJson() => {
    'countryId' : countryId,
    'iso' : iso,
    'countryName' : countryName,
    'longCountryName' : longCountryName,
    'iso3' : iso3,
    'countryCode' : countryCode,
    'unMemberState' : unMemberState,
    'callingCode' : callingCode,
    'ccTld' : ccTld,
    'status' : status,
    'lastModified' : lastModified,
    'isDeleted' : isDeleted,
    'guidId' : guidId,
    'manualStoreId' : manualStoreId,
    'image' : image,
    'countryWiseStoreViewModels' : countryWiseStoreViewModels
  };
}

class StateViewModel {
  final int? stateId;
  final int? countryId;
  final dynamic countryName;
  final dynamic stateName;
  final dynamic isDeleted;
  final dynamic guidId;

  StateViewModel({
    this.stateId,
    this.countryId,
    this.countryName,
    this.stateName,
    this.isDeleted,
    this.guidId,
  });

  StateViewModel.fromJson(Map<String, dynamic> json)
      : stateId = json['stateId'] as int?,
        countryId = json['countryId'] as int?,
        countryName = json['countryName'],
        stateName = json['stateName'],
        isDeleted = json['isDeleted'],
        guidId = json['guidId'];

  Map<String, dynamic> toJson() => {
    'stateId' : stateId,
    'countryId' : countryId,
    'countryName' : countryName,
    'stateName' : stateName,
    'isDeleted' : isDeleted,
    'guidId' : guidId
  };
}

class CityViewModel {
  final int? cityId;
  final int? stateId;
  final dynamic cityName;
  final dynamic status;
  final dynamic lastModified;
  final dynamic isDeleted;
  final dynamic stateName;
  final dynamic guidId;

  CityViewModel({
    this.cityId,
    this.stateId,
    this.cityName,
    this.status,
    this.lastModified,
    this.isDeleted,
    this.stateName,
    this.guidId,
  });

  CityViewModel.fromJson(Map<String, dynamic> json)
      : cityId = json['cityId'] as int?,
        stateId = json['stateId'] as int?,
        cityName = json['cityName'],
        status = json['status'],
        lastModified = json['lastModified'],
        isDeleted = json['isDeleted'],
        stateName = json['stateName'],
        guidId = json['guidId'];

  Map<String, dynamic> toJson() => {
    'cityId' : cityId,
    'stateId' : stateId,
    'cityName' : cityName,
    'status' : status,
    'lastModified' : lastModified,
    'isDeleted' : isDeleted,
    'stateName' : stateName,
    'guidId' : guidId
  };
}

class CompanyProfileViewModel {
  final int? companyProfileId;
  final dynamic companyName;
  final dynamic vatNo;
  final dynamic phone;
  final dynamic email;
  final dynamic address;
  final dynamic logo;
  final dynamic status;
  final dynamic lastModified;
  final dynamic isDeleted;

  CompanyProfileViewModel({
    this.companyProfileId,
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

  CompanyProfileViewModel.fromJson(Map<String, dynamic> json)
      : companyProfileId = json['companyProfileId'] as int?,
        companyName = json['companyName'],
        vatNo = json['vatNo'],
        phone = json['phone'],
        email = json['email'],
        address = json['address'],
        logo = json['logo'],
        status = json['status'],
        lastModified = json['lastModified'],
        isDeleted = json['isDeleted'];

  Map<String, dynamic> toJson() => {
    'companyProfileId' : companyProfileId,
    'companyName' : companyName,
    'vatNo' : vatNo,
    'phone' : phone,
    'email' : email,
    'address' : address,
    'logo' : logo,
    'status' : status,
    'lastModified' : lastModified,
    'isDeleted' : isDeleted
  };
}