class RemoveAllCart {
  final int? cartId;
  final int? productMasterId;
  final int? customerId;
  final String? tempId;
  final int? quantity;
  final int? unitPrice;
  final String? status;
  final int? productSubSKUId;
  final int? currencyId;
  final int? supplierId;
  final int? storeId;
  final String? serviceDateTime;
  final List<InputFieldValueRequestModels>? inputFieldValueRequestModels;

  RemoveAllCart({
    this.cartId,
    this.productMasterId,
    this.customerId,
    this.tempId,
    this.quantity,
    this.unitPrice,
    this.status,
    this.productSubSKUId,
    this.currencyId,
    this.supplierId,
    this.storeId,
    this.serviceDateTime,
    this.inputFieldValueRequestModels,
  });

  RemoveAllCart.fromJson(Map<String, dynamic> json)
      : cartId = json['cartId'] as int?,
        productMasterId = json['productMasterId'] as int?,
        customerId = json['customerId'] as int?,
        tempId = json['tempId'] as String?,
        quantity = json['quantity'] as int?,
        unitPrice = json['unitPrice'] as int?,
        status = json['status'] as String?,
        productSubSKUId = json['productSubSKUId'] as int?,
        currencyId = json['currencyId'] as int?,
        supplierId = json['supplierId'] as int?,
        storeId = json['storeId'] as int?,
        serviceDateTime = json['serviceDateTime'] as String?,
        inputFieldValueRequestModels = (json['inputFieldValueRequestModels'] as List?)?.map((dynamic e) => InputFieldValueRequestModels.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'cartId' : cartId,
    'productMasterId' : productMasterId,
    'customerId' : customerId,
    'tempId' : tempId,
    'quantity' : quantity,
    'unitPrice' : unitPrice,
    'status' : status,
    'productSubSKUId' : productSubSKUId,
    'currencyId' : currencyId,
    'supplierId' : supplierId,
    'storeId' : storeId,
    'serviceDateTime' : serviceDateTime,
    'inputFieldValueRequestModels' : inputFieldValueRequestModels?.map((e) => e.toJson()).toList()
  };
}

class InputFieldValueRequestModels {
  final int? inputFieldListId;
  final String? inputFieldValue;

  InputFieldValueRequestModels({
    this.inputFieldListId,
    this.inputFieldValue,
  });

  InputFieldValueRequestModels.fromJson(Map<String, dynamic> json)
      : inputFieldListId = json['inputFieldListId'] as int?,
        inputFieldValue = json['inputFieldValue'] as String?;

  Map<String, dynamic> toJson() => {
    'inputFieldListId' : inputFieldListId,
    'inputFieldValue' : inputFieldValue
  };
}