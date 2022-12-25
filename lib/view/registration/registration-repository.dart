import 'package:near_expiry/http-service/api_response.dart';
import 'package:near_expiry/http-service/http-service.dart';
import 'package:near_expiry/locator/locator.dart';
import 'package:near_expiry/utils/api-constant.dart';
import 'package:near_expiry/view/registration/registration-model/body-data/registration-body.dart';
import 'package:near_expiry/view/registration/registration-model/registration-model.dart';

class RegistrationRepository {

  var _httpService = locator<HttpService>();

  Future<ApiResponse<RegistrationResponseData>> postRegistration(BodyRegistrationData data) async {

    var apiResponse = await _httpService.postRequest(ApiConstant.SERVER+ApiConstant.REGISTRATION_POST,
    data: data.toJson()
    );

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data: RegistrationResponseData.fromJson(apiResponse.data.data)
    );

  }

}