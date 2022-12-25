
import 'package:flutter/material.dart';
import 'package:near_expiry/locator/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login-repository.dart';
import 'model/custommer-login.dart';

class CustommerLoginController extends ChangeNotifier{

  var _login_repo = locator<LoginRepository>();

  CustommerLogin ?custommerLogin;

  Future<bool>  postLogin(String userName,String password,bool isRemember)async{
    var apiresponse = await _login_repo.userLogin(userName,password,isRemember);
    if(apiresponse.httpCode==200){
      custommerLogin=apiresponse.data;

      return true;
    }else return false;
  }

}