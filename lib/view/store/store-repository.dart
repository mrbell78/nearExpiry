import 'package:near_expiry/http-service/api_response.dart';
import 'package:near_expiry/http-service/http-service.dart';
import 'package:near_expiry/locator/locator.dart';
import 'package:near_expiry/utils/api-constant.dart';
import 'package:near_expiry/view/store/store-model/all-country-list-responsedata.dart';
import 'package:near_expiry/view/store/store-model/store-list-response-data.dart';

class StoreRepository {

  var _httpService = locator<HttpService>();



  Future<ApiResponse<List<StoreListResponseData?>>> getAllStoreListCountryWise(int countryId) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.STORE_LIST,
    qp: {
      "countryId":countryId.toString()
    }
    );


    List<StoreListResponseData> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            StoreListResponseData.fromJson(element),
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


  Future<ApiResponse<List<StoreListResponseData?>>> getAllStoreList() async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.STORE_LIST,

    );


    List<StoreListResponseData> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            StoreListResponseData.fromJson(element),
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


  Future<ApiResponse<List<AllCountryListResponseData?>>> getAllCountryList() async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.ALL_COUNTRY_LIST,);


    List<AllCountryListResponseData> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            AllCountryListResponseData.fromJson(element),
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


}