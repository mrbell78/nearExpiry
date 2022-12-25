
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:near_expiry/app-colors/app-colors.dart';
import 'package:near_expiry/utils/nav_utils.dart';
import 'package:near_expiry/view/login/login.dart';
import 'package:near_expiry/view/profile/edit-profile.dart';
import 'package:near_expiry/view/profile/my-orders.dart';
import 'package:near_expiry/view/profile/my-profile.dart';
import 'package:near_expiry/view/profile/profile-controller.dart';
import 'package:near_expiry/view/store/store-controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerCustom extends StatefulWidget{

  final custommerId;

  DrawerCustom(this.custommerId);

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  bool isToggled =false;

  bool isToggled_notification =false;

  final ImagePicker _picker = ImagePicker();
  // Pick an image
  late final XFile? image;


  Future<XFile?> selectImage()async{
    final XFile ? selected = await _picker.pickImage(source: ImageSource.gallery);
    if(selected!=null && selected!.path.isNotEmpty){
      setState(() {
        //image=selected;
      });

      return selected;
    }else return null;
  }



  @override
  void initState() {

    Provider.of<ProfileController>(context, listen: false).getUserData().then((value) {

      print("the custommer id is ${ Provider.of<ProfileController>(context, listen: false).custommerLogin!.customerId}");

      Provider.of<ProfileController>(context, listen: false).getUserProfile();



    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Consumer<ProfileController>(

      builder: (ctx,provider,child){
        return Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 20),
                      height: 305,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/image-transparent-store.png",)
                          ),
                          color: AppColors.primary
                      ),

                      child: Row(

                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 116,
                                width: 116,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),

                                ),

                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    child: CachedNetworkImage(
                                      imageUrl: "${provider.userProfile!=null?provider.userProfile!.image:""}",
                                      height: 116,
                                      width: 116,
                                      fit: BoxFit.cover,
                                      errorWidget: (ctx,url,error)=>Image.asset("assets/images/profile_image.png",fit: BoxFit.cover,),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 8,
                                bottom: 3,
                                child: InkWell(
                                  onTap: () async {
                                    selectImage().then((value) async {
                                      String fileName = value!.path.split('/').last;

                                      print("customer id: ${provider.custommerLogin!.customerId}");

                                      FormData formdata = FormData.fromMap(
                                          {
                                            "CustomerId":provider.custommerLogin!.customerId,
                                            "Image": await MultipartFile.fromFile(value!.path, filename: fileName,),
                                          }

                                      );
                                      print("image name: ${fileName}");
                                      await provider.upLoadProfileImage(formdata).then((value) async {
                                        await provider.getUserProfile();
                                      });
                                    });



                                  },
                                  child: Container(
                                    height: 26,
                                    width: 26,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: AppColors.pureWhite,
                                        borderRadius: BorderRadius.all(Radius.circular(100)),
                                        border: Border.all(color: AppColors.primary,width: 3)
                                    ),
                                    child: Center(
                                      child: Image.asset("assets/images/ic-camera.png"),
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("${provider.userProfile?.userName??"No User Name"}",style: TextStyle(color: AppColors.pureWhite,fontSize: 17,fontWeight: FontWeight.w500),),

                              Row(

                                children: [
                                  Image.asset("assets/images/ic-location-white.png"),
                                  SizedBox(width: 5,),
                                  Text("${provider.userProfile!=null? provider.userProfile!.customerAddressViewModel!.address:"No address"}",style: TextStyle(color: AppColors.pureWhite,fontSize: 9,),),


                                ],
                              ),
                            ],
                          ),

                        ],
                      )

                  ),

                  Positioned(
                    right: 5,
                    top:60,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Image.asset("assets/images/ic-close-white.png"),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)

                      ),
                      color: Colors.white
                  ),

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        InkWell(
                          onTap: (){
                            if(provider.custommerLogin!.customerId!=null){
                              NavUtils.push(context, MyProfile());
                            }else{
                              Fluttertoast.showToast(
                                  msg: "You are not loged in",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightRedFFF1F1,
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: Image.asset("assets/images/ic-person-colored.png"),
                                ),
                                SizedBox(width: 15,),

                                Text("My Profile",style: TextStyle(color: AppColors.primary,fontSize: 12,fontWeight: FontWeight.w500),),

                              ],
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left:80,right: 40),
                            child: Divider(color: AppColors.grayDBDBDB,thickness: 1,)),


                        InkWell(
                          onTap: (){
                            if(provider.custommerLogin?.customerId!=null){
                              NavUtils.push(context, EditProfile(provider.custommerLogin!.customerId));

                            }else{
                              Fluttertoast.showToast(
                                  msg: "You are not loged in",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.blueF5F8FD,
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: Image.asset("assets/images/ic-location.png"),
                                ),
                                SizedBox(width: 15,),

                                Text("Address",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                              ],
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left:80,right: 40),
                            child: Divider(color: AppColors.grayDBDBDB,thickness: 1,)),


                        InkWell(
                          onTap: (){

                            if(provider.custommerLogin!=null && provider.custommerLogin!.customerId!=null){
                              NavUtils.push(context, MyOrders(provider.custommerLogin!.customerId));
                            }else{
                              Fluttertoast.showToast(
                                  msg: "You are not loged in",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );

                              NavUtils.push(context, Login());
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.blueF5F8FD,
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: Image.asset("assets/images/ic-myorder.png"),
                                ),
                                SizedBox(width: 15,),

                                Text("My Orders",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                              ],
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left:80,right: 40),
                            child: Divider(color: AppColors.grayDBDBDB,thickness: 1,)),

                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20),
                          padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.blueF5F8FD,
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                ),
                                child: Image.asset("assets/images/ic-store-recepints.png"),
                              ),
                              SizedBox(width: 15,),

                              Text("Store Receipts",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left:80,right: 40),
                            child: Divider(color: AppColors.grayDBDBDB,thickness: 1,)),
                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20),
                          padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.blueF5F8FD,
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                ),
                                child: Image.asset("assets/images/ic-coupon.png"),
                              ),
                              SizedBox(width: 15,),

                              Text("Coupon & Vouchers",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),
                              Spacer(),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left:80,right: 40),
                            child: Divider(color: AppColors.grayDBDBDB,thickness: 1,)),



                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20),
                          padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.blueF5F8FD,
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                ),
                                child: Image.asset("assets/images/ic-custommer-service.png"),
                              ),
                              SizedBox(width: 15,),

                              Text("Customer Service",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left:80,right: 40),
                            child: Divider(color: AppColors.grayDBDBDB,thickness: 1,)),


                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20),
                          padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.blueF5F8FD,
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                ),
                                child: Image.asset("assets/images/ic-love.png"),
                              ),
                              SizedBox(width: 15,),

                              Text("Wish List",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left:80,right: 40),
                            child: Divider(color: AppColors.grayDBDBDB,thickness: 1,)),


                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20),
                          padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.blueF5F8FD,
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                ),
                                child: Image.asset("assets/images/ic-t&c.png"),
                              ),
                              SizedBox(width: 15,),

                              Text("Terms & Condition",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left:80,right: 40),
                            child: Divider(color: AppColors.grayDBDBDB,thickness: 1,)),


                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20),
                          padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.blueF5F8FD,
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                ),
                                child: Image.asset("assets/images/ic-document-privacy.png"),
                              ),
                              SizedBox(width: 15,),

                              Text("Privacy Policy",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left:80,right: 40),
                            child: Divider(color: AppColors.grayDBDBDB,thickness: 1,)),


                        InkWell(
                          onTap: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.remove("logininfo").then((value) {
                              Provider.of<StoreController>(context, listen: false).getUserData();
                              setState(() {
                                Navigator.pop(context,true);
                              });
                            });

                            await prefs.clear();

                            setState(() {
                              Fluttertoast.showToast(
                                  msg: "you are loged out",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.blueF5F8FD,
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: Image.asset("assets/images/ic-logout.png"),
                                ),
                                SizedBox(width: 15,),

                                Text("LogOut",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                              ],
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left:80,right: 40),
                            child: Divider(color: AppColors.grayDBDBDB,thickness: 1,)),


                        SizedBox(height: 20,),




                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },

    );
  }
}