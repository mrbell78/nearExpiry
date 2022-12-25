
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:near_expiry/locator/locator.dart';
import 'package:near_expiry/view/login/model/custommer-login.dart';
import 'package:near_expiry/view/store/store-model/all-country-list-responsedata.dart';
import 'package:near_expiry/view/store/store-model/store-list-response-data.dart';
import 'package:near_expiry/view/store/store-repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreController extends ChangeNotifier{


  var _store_repo = locator<StoreRepository>();

  // all response list

  bool _isloading=false;


  bool get isloading => _isloading;
  CustommerLogin? custommerLogin;

  set isloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  List<StoreListResponseData?> storeList=[];
  List<AllCountryListResponseData?> allCountryLIst=[];

  List<String>countryName=[];


   getAllStoreListCountrywise(int  countryId)async{
     isloading=true;
    var apiresponse = await _store_repo.getAllStoreListCountryWise(countryId);

    if(apiresponse.httpCode==200){
      storeList.clear();
      storeList.addAll(apiresponse.data);
      isloading=false;
    }

    notifyListeners();

  }

  getAllStoreList()async{
    isloading=true;
    var apiresponse = await _store_repo.getAllStoreList();

    if(apiresponse.httpCode==200){
      storeList.clear();
      storeList.addAll(apiresponse.data);
      isloading=false;
    }

    notifyListeners();

  }



  getAllCountryList()async{
    var apiresponse = await _store_repo.getAllCountryList();

    if(apiresponse.httpCode==200){
      allCountryLIst.clear();
      allCountryLIst.addAll(apiresponse.data);
      allCountryLIst.forEach((element) {

        countryName.add(element!.image);

      });
    }

    notifyListeners();

  }

  Future<bool> getUserData()async{
    custommerLogin=null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loginData = (prefs.getString('logininfo') ?? "") ;
    if(loginData!=null && loginData.isNotEmpty){
      print("the data is ${loginData}");
      Map<String,dynamic> mapdata= jsonDecode(loginData);
      custommerLogin  =CustommerLogin.fromJson(mapdata);
      notifyListeners();
      return true;

    }else return false;

  }

}