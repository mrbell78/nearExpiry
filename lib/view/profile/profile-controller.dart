import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:near_expiry/locator/locator.dart';
import 'package:near_expiry/view/login/model/custommer-login.dart';
import 'package:near_expiry/view/profile/profile-repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/add-address.dart';
import 'model/delivery-address.dart';
import 'model/my-orderlist-responsedata.dart';
import 'model/previous-orderedItems.dart';
import 'model/user-profile-response-data.dart';

class ProfileController extends ChangeNotifier{

  var _profileRepo = locator<ProfileRepository>();

  CustommerLogin? custommerLogin;

  AddAddressResponseData ?addAddressResponseData;
  UserProfile ? userProfile;

  List<MyOrderList?> myorderList=[];
  List<PreviousOrderedItems?> previousOrderedItemslist=[];




  Future<bool> getUserData()async{
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


   Future<bool>  addAddress(data)async{
    var apiresponse = await _profileRepo.addAddress(data);
    if(apiresponse.httpCode==200){
      addAddressResponseData=apiresponse.data;
      return true;
    }else return false;



  }

    getMyOrderList(int CustommerId)async{
    var apiresponse = await _profileRepo.getMyOrderList(CustommerId);
    if(apiresponse.httpCode==200){
      myorderList.clear();
      myorderList.addAll(apiresponse.data);
    }
    notifyListeners();

  }


  getPreviousOrderedItems(int custommerId)async{
    var apiresponse = await _profileRepo.getPreviousOrderItems(custommerId);
    if(apiresponse.httpCode==200){
      previousOrderedItemslist.clear();
      previousOrderedItemslist.addAll(apiresponse.data);
    }
    notifyListeners();

  }

  Future<bool> upLoadProfileImage(fdata)async{
   var apiresponse  =await _profileRepo.upLoadImage(fdata);
    notifyListeners();

    if(apiresponse.httpCode==200){
      return true;
    }else return false;

  }

  getUserProfile()async{
    var apiresponse = await _profileRepo.getProfileUser(custommerLogin!.customerId);
    if(apiresponse.httpCode==200){

      userProfile=apiresponse.data;
      print("user data call success");
    }
    notifyListeners();

  }



}