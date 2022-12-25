import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:near_expiry/app-colors/app-colors.dart';
import 'package:near_expiry/view/products/product-controller.dart';
import 'package:near_expiry/view/profile/profile-controller.dart';
import 'package:provider/provider.dart';

import 'model/bodydata/body-add-address.dart';


class EditProfile extends StatelessWidget{

  int customerId;

  EditProfile(this.customerId);

  TextEditingController fullName = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController homeAddress = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController address2 = TextEditingController();
  bool validateName=false;


  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(

      builder: (context,provider,child){
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  height: 130,

                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],

                  ),
                  child: Center(
                    child: Row(

                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset("assets/images/ic-back-appbar.png")),
                        Spacer(),
                        Text("Edit Profile",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.w500),),
                        Spacer(),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 50,),

                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    children: [
                      Container(
                          child:Image.asset("assets/images/ic-profile.png")

                      ),
                      SizedBox(width: 8,),
                      Text("Full Name",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    controller: fullName,
                    style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                    decoration: InputDecoration(
                        hintText: "admin",
                        suffixIcon: Image.asset("assets/images/ic-edit.png"),
                        hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                        contentPadding: EdgeInsets.all(5),
                        errorText: validateName? 'Name Can\'t Be Empty':null
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    children: [
                      Container(
                          child:Image.asset("assets/images/ic-mail.png")

                      ),
                      SizedBox(width: 8,),
                      Text("Email",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    controller: mail,
                    style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                    decoration: InputDecoration(
                        hintText: "admin@gmail.com",
                        suffixIcon: Image.asset("assets/images/ic-edit.png"),
                        hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                        contentPadding: EdgeInsets.only(top: 20),
                        errorText: validateName? 'Name Can\'t Be Empty':null
                    ),
                  ),
                ),


                SizedBox(height: 20,),

                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    children: [
                      Container(
                          child:Image.asset("assets/images/ic-phone.png")

                      ),
                      SizedBox(width: 8,),
                      Text("Mobile Number",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: mobileNumber,
                    style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                    decoration: InputDecoration(
                        hintText: "163265",
                        suffixIcon: Image.asset("assets/images/ic-edit.png"),
                        hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                        contentPadding: EdgeInsets.all(5),
                        errorText: validateName? 'Name Can\'t Be Empty':null
                    ),
                  ),
                ),


                SizedBox(height: 20,),


                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(

                            child: Row(
                              children: [
                                Container(
                                    child:Image.asset("assets/images/ic-location.png")

                                ),
                                SizedBox(width: 8,),
                                Text("Type",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                              ],
                            ),
                          ),
                          Container(

                            width: MediaQuery.of(context).size.width/3,
                            child: TextField(

                              controller: type,
                              style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                              decoration: InputDecoration(
                                  hintText: "",
                                  hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                                  prefixIcon: Image.asset("assets/images/ic-home.png"),
                                  suffixIcon: Image.asset("assets/images/ic-edit.png"),
                                  contentPadding: EdgeInsets.only(top: 20),
                                  errorText: validateName? 'Name Can\'t Be Empty':null
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(

                            child: Row(
                              children: [
                                Container(
                                    child:Image.asset("assets/images/ic-location.png")

                                ),
                                SizedBox(width: 8,),
                                Text("Name of Address",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                              ],
                            ),
                          ),
                          Container(


                            width: MediaQuery.of(context).size.width/3,
                            child: TextField(

                              controller: homeAddress,
                              style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                              decoration: InputDecoration(
                                  hintText: "Home",
                                  suffixIcon: Image.asset("assets/images/ic-edit.png"),
                                  hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                                  contentPadding: EdgeInsets.only(top: 20),
                                  errorText: validateName? 'Name Can\'t Be Empty':null
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),


                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(

                            child: Row(
                              children: [
                                Container(
                                    child:Image.asset("assets/images/ic-location.png")

                                ),
                                SizedBox(width: 8,),
                                Text("Country",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                              ],
                            ),
                          ),
                          Container(

                            width: MediaQuery.of(context).size.width/3,
                            child: TextField(

                              controller: country,
                              style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                              decoration: InputDecoration(
                                  hintText: "UAE",
                                  hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),

                                  suffixIcon: Image.asset("assets/images/ic-edit.png"),
                                  contentPadding: EdgeInsets.only(top: 20),
                                  errorText: validateName? 'Name Can\'t Be Empty':null
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(

                            child: Row(
                              children: [
                                Container(
                                    child:Image.asset("assets/images/ic-location.png")

                                ),
                                SizedBox(width: 8,),
                                Text("City",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                              ],
                            ),
                          ),
                          Container(


                            width: MediaQuery.of(context).size.width/3,
                            child: TextField(

                              controller: city,
                              style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                              decoration: InputDecoration(
                                  hintText: "Dubai",
                                  suffixIcon: Image.asset("assets/images/ic-edit.png"),
                                  hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                                  contentPadding: EdgeInsets.only(top: 20),
                                  errorText: validateName? 'Name Can\'t Be Empty':null
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    children: [
                      Container(
                          child:Image.asset("assets/images/ic-location.png")

                      ),
                      SizedBox(width: 8,),
                      Text("Address",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    controller: address,
                    style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                    decoration: InputDecoration(
                        hintText: "64/A UAE,DUBAI",
                        suffixIcon: Image.asset("assets/images/ic-edit.png"),
                        hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                        contentPadding: EdgeInsets.all(5),
                        errorText: validateName? 'Name Can\'t Be Empty':null
                    ),
                  ),
                ),


                SizedBox(height: 20,),

                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    children: [
                      Container(
                          child:Image.asset("assets/images/ic-location.png")

                      ),
                      SizedBox(width: 8,),
                      Text("Address 2(Optional)",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    controller: address2,
                    style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                    decoration: InputDecoration(
                        hintText: "64/A UAE,DUBAI",
                        suffixIcon: Image.asset("assets/images/ic-edit.png"),
                        hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                        contentPadding: EdgeInsets.all(5),
                        errorText: validateName? 'Name Can\'t Be Empty':null
                    ),
                  ),
                ),

                SizedBox(height: 100,),

                Container(
                  height: 120,

                  decoration: BoxDecoration(
                    color: AppColors.pureWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 7,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),

                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      children: [

                        InkWell(
                          onTap: ()async{

                            var data = BodyAddAddress(
                                status: "billing address",
                                cityName:city.text,
                                phoneNumber: mobileNumber.text,
                                address: homeAddress.text,
                                countryName: country.text,
                                addressType:type.text,
                                customerId: customerId,
                                countryId: 13,
                                stateId: 2002,
                                cityId: 2002,
                                addressLine2: address2.text,
                                zipCode: "1216"



                            );

                           await provider.addAddress(data).then((value)
                            {

                              Fluttertoast.showToast(
                                  msg: "address added",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              Provider.of<ProductController>(context, listen: false).getDeliveryAddress(customerId);
                              Navigator.pop(context,true);

                            }

                            );

                          },
                          child: Container(
                            width: 150,
                            height: 52,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: AppColors.defaultblack
                            ),
                            child: Center(child: Text("Update",style: TextStyle(color: AppColors.pureWhite,fontSize: 14,fontWeight: FontWeight.w500),),),
                          ),
                        ),

                        Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.pop(context,true);
                          },
                          child: Container(
                            width: 150,
                            height: 52,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: AppColors.primary)
                            ),
                            child: Center(child: Text("Cancel",style: TextStyle(color: AppColors.primary,fontSize: 14,fontWeight: FontWeight.w500),),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },

    );
  }

}