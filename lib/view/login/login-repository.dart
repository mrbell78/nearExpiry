import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:near_expiry/http-service/api_response.dart';
import 'package:near_expiry/http-service/http-service.dart';
import 'package:near_expiry/locator/locator.dart';
import 'package:near_expiry/utils/api-constant.dart';
import 'package:near_expiry/view/store/store-model/store-list-response-data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/custommer-login.dart';

class LoginRepository{
  var _httpService = locator<HttpService>();

  Future<ApiResponse<CustommerLogin?>> userLogin(String userName, String password,bool isRember) async {

    var apiResponse = await _httpService.postRequest(ApiConstant.SERVER+ApiConstant.LOGIN,
    data: {
      "userName":userName,
      "password":password,
      "isRemimber":isRember
    }
    );

    if(apiResponse.httpCode==200){
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('logininfo', jsonEncode(apiResponse.data.data)).then((value) {
        print("login info saved");
      });


    }
    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:CustommerLogin.fromJson(apiResponse.data.data)
    );

}




}