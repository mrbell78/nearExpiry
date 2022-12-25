import 'package:near_expiry/http-service/api_response.dart';
import 'package:near_expiry/http-service/http-service.dart';
import 'package:near_expiry/locator/locator.dart';
import 'package:near_expiry/utils/api-constant.dart';
import 'package:near_expiry/view/products/model/related-product-you-may-like.dart';
import 'package:near_expiry/view/profile/model/delivery-address.dart';
import 'package:near_expiry/view/store/store-model/store-list-response-data.dart';

import 'add-to-cartlist.dart';
import 'model/add-to-cart-responsedata.dart';
import 'model/add-to-cartlistResponseData.dart';
import 'model/body/body-add-to-cart.dart';
import 'model/body/body-order.dart';
import 'model/body/body-remove-all-cart.dart';
import 'model/order-checkout-responsedata.dart';
import 'model/parent-category-response-data.dart';
import 'model/product-details.dart';
import 'model/product-response-data.dart';
import 'model/recently-ordered-items.dart';
import 'model/remove-all-cart.dart';
import 'model/sub-category-item-list.dart';
import 'model/trending-slider.dart';

class ProductRepository{

  var _httpService = locator<HttpService>();


  Future<ApiResponse<List<ParentCategory?>>> getProductParentCategory(int languageId) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.PRODUCT_PARENT_CATEGORY+"/${languageId}",);


    List<ParentCategory> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            ParentCategory.fromJson(element),
          );
        },
      );
    }

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:list
    );

  }



  Future<ApiResponse<List<ProductResponseData?>>> getProducts(int languageId,int productTypeid, int countryId,int currencyId,) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.PRODUCT_LIST+"/${languageId}"
        +"/${productTypeid}" +"/${countryId}"+"/${currencyId}",);


    List<ProductResponseData> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            ProductResponseData.fromJson(element),
          );
        },
      );
    }

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:list
    );

  }


  Future<ApiResponse<List<ProductResponseData?>>> getProductsbyCategory(int languageId,int productTypeid, int countryId,int currencyId,int Categoryid) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.PRODUCT_LIST+"/${languageId}"
        +"/${productTypeid}" +"/${countryId}"+"/${currencyId}",
    qp: {
      "categoryId":Categoryid.toString()
    }
    );


    List<ProductResponseData> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            ProductResponseData.fromJson(element),
          );
        },
      );
    }

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:list
    );

  }


  Future<ApiResponse<ProductDetails>> getProductDetails(int id,int languageId, int countryId,int currencyId,customerId,
      ) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.PRODUCT_DETAILS+"/${id}",

        qp: {
          "languageId":4.toString(),
          "countryId":1.toString(),

        }
    );
    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:ProductDetails.fromJson(apiResponse.data.data)
    );

  }



  Future<ApiResponse<AddtoCartResponseData>> addTocartPost(BodyAddtoCart data) async {

    var apiResponse = await _httpService.postRequest(ApiConstant.SERVER+ApiConstant.ADD_TO_CARD,data: data.toJson());
    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:AddtoCartResponseData.fromJson(apiResponse.data.data)
    );

  }



  Future<ApiResponse<List<AddtoCartListResponseData?>>> getCartItems(int custommerId,String TempId) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.ADD_TO_CARD_LIST,
    qp: {
      "customerId":custommerId.toString(),
      "TempId":TempId.toString()
    }
    );


    List<AddtoCartListResponseData> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
              AddtoCartListResponseData.fromJson(element)
          );
        },
      );
    }

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:list
    );

  }



  Future<ApiResponse<MyOrderCheckOut>>  checkOutOrder(BodyOrder data) async {

    var apiResponse = await _httpService.postRequest(ApiConstant.SERVER+ApiConstant.ORDER_CHECKOUT,data: data.toJson());

    if(apiResponse.data.data!=null){
      print("the data found ");
    }
    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:MyOrderCheckOut.fromJson(apiResponse.data.data)
    );

  }



  Future<ApiResponse<String>> deleteCartItem(int cartId) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.REMOVE_SINGLE_CART+"${cartId}",);
    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:"deleted"
    );

  }


  Future<ApiResponse<List<DeliveryAddress?>>> getDeliveryAddress(int custommerId) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.CUSTOMER_DELIVERY_ADDRESS,qp: {
      "customerId":custommerId.toString(),
    });


    List<DeliveryAddress?> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            DeliveryAddress.fromJson(element),
          );
        },
      );
    }

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:list
    );

  }


  Future<ApiResponse<List<YouMayLikeReletedProduct?>>> getRelatedProductYoumayLike(int productMasterId,languageId,currencyId) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.RELATED_PRODUCT_YOU_MAY_LIKE,qp: {
      "productMasterId":productMasterId.toString(),
      "languageId":languageId.toString(),
      "currencyId":currencyId.toString(),
    });


    List<YouMayLikeReletedProduct?> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            YouMayLikeReletedProduct.fromJson(element),
          );
        },
      );
    }

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:list
    );

  }



  Future<ApiResponse<List<TrendingSlider?>>> getTrendingSlider() async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.TRENDING_BANNER,);


    List<TrendingSlider?> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            TrendingSlider.fromJson(element),
          );
        },
      );
    }

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:list
    );

  }

  Future<ApiResponse<List<RecentlyOrdereedItems?>>> getRecentlyOrderedItems(int languageId, int productTypeId,int countryId,int currencyId) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.RECENTLY_ORDERED_ITEMS+"/${languageId}"+"/${productTypeId}"+"/${countryId}"+"/${currencyId}",
   /* qp: {

      "languageId":languageId.toString(),
      "productTypeId":productTypeId.toString(),
      "countryId":countryId.toString(),
      "currencyId":currencyId.toString()

    }*/
    );


    List<RecentlyOrdereedItems?> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            RecentlyOrdereedItems.fromJson(element),
          );
        },
      );
    }

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:list
    );

  }


  Future<ApiResponse<List<SubCategoryItemList?>>> getSubCategoryItem(int languageId) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.SUB_CATEGORY_ITEMLIST+"/${languageId}",

    );


    List<SubCategoryItemList?> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            SubCategoryItemList.fromJson(element),
          );
        },
      );
    }

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:list
    );

  }



  Future<ApiResponse<RemoveAllCart>>  removeAllCart(BodyRemoveAllCart data) async {

    var apiResponse = await _httpService.postRequest(ApiConstant.SERVER+ApiConstant.REMOVE_ALL_CART,data: data.toJson());



    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:RemoveAllCart.fromJson(apiResponse.data.data)
    );

  }

}