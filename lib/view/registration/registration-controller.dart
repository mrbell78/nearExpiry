
import 'package:flutter/material.dart';
import 'package:near_expiry/locator/locator.dart';
import 'package:near_expiry/view/registration/registration-model/registration-model.dart';
import 'package:near_expiry/view/registration/registration-repository.dart';

class RegistrationController extends ChangeNotifier{

  var _registration_repo = locator<RegistrationRepository>();
  RegistrationResponseData? registrationResponseData;

 Future<bool>  postRegistration(data)async{
    var apiresponse = await _registration_repo.postRegistration(data);
    if(apiresponse.httpCode==200){
      registrationResponseData=apiresponse.data;

      return true;
    }else return false;



  }

}