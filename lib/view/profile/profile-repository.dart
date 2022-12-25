import 'package:dio/dio.dart';
import 'package:near_expiry/http-service/api_response.dart';
import 'package:near_expiry/http-service/http-service.dart';
import 'package:near_expiry/locator/locator.dart';
import 'package:near_expiry/utils/api-constant.dart';
import 'package:near_expiry/view/registration/registration-model/registration-model.dart';

import 'model/add-address.dart';
import 'model/bodydata/body-add-address.dart';
import 'model/delivery-address.dart';
import 'model/my-orderlist-responsedata.dart';
import 'model/previous-orderedItems.dart';
import 'model/user-profile-response-data.dart';

class ProfileRepository{

  var _httpService = locator<HttpService>();

  Future<ApiResponse<AddAddressResponseData>> addAddress(BodyAddAddress data) async {

    var apiResponse = await _httpService.postRequest(ApiConstant.SERVER+ApiConstant.ADD_ADDRESS,
        data: data.toJson()
    );

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data: AddAddressResponseData.fromJson(apiResponse.data.data)
    );

  }


  Future<ApiResponse<List<MyOrderList?>>> getMyOrderList(int custommerId) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.MY_ORDER_LIST,
    qp: {
      "userId":custommerId.toString()
    });


    List<MyOrderList> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            MyOrderList.fromJson(element),
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

  Future<ApiResponse<List<PreviousOrderedItems?>>> getPreviousOrderItems(int custommerId ) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.PREVIOUS_ORDEREDITEMS,
      qp: {
      "userId":custommerId.toString()
      }
       );


    List<PreviousOrderedItems> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            PreviousOrderedItems.fromJson(element),
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




  Future<ApiResponse<dynamic>> upLoadImage(FormData fdata) async {
    print("upload method is called");

    var apiResponse = await _httpService.postRequesturlencoded(ApiConstant.SERVER+ApiConstant.UPLOAD_IMAGE,

        data: fdata
    );

    return ApiResponse(httpCode: apiResponse.httpCode, message: "success", data: apiResponse.data.data);




  }


  Future<ApiResponse<UserProfile>> getProfileUser(int custommerId) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.USER_PROFILE,
      qp: {
      "userId":custommerId.toString()
      }
    );

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:UserProfile.fromJson(apiResponse.data.data)
    );

  }













}