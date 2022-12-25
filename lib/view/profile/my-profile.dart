import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:near_expiry/app-colors/app-colors.dart';
import 'package:near_expiry/view/profile/profile-controller.dart';
import 'package:provider/provider.dart';



class MyProfile extends StatefulWidget{

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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

      print("the user id is ${ Provider.of<ProfileController>(context, listen: false).custommerLogin!.customerId}");

      Provider.of<ProfileController>(context, listen: false).getUserProfile();

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<ProfileController>(

      builder: (context,provider,child){
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 305,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/image-transparent-store.png",)
                      ),
                      color: AppColors.primary
                  ),

                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 20),
                            child: Image.asset("assets/images/ic-back-white.png"),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                        width: 116,
                                        height: 116,
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
                                    onTap: (){
                                      selectImage().then((value) async {
                                        String fileName = value!.path.split('/').last;

                                        print("custommer id inside method:  ${provider.custommerLogin!.customerId}");

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

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${provider.userProfile!=null?provider.userProfile!.userName:"No Name"}",style: TextStyle(color: AppColors.pureWhite,fontSize: 17,fontWeight: FontWeight.w500),),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/ic-location-white.png"),
                            SizedBox(width: 5,),
                            Text("${provider.userProfile!=null?provider.userProfile!.customerAddressViewModel!.address:"No address"}",style: TextStyle(color: AppColors.pureWhite,fontSize: 9,),),


                          ],
                        ),

                      ],
                    ),
                  )

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
                        Container(
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

                              Text("Name",style: TextStyle(color: AppColors.primary,fontSize: 12,fontWeight: FontWeight.w500),),

                              Spacer(),

                              Text("${provider.userProfile!=null?provider.userProfile!.userName:"No name"}",style: TextStyle(color: AppColors.primary,fontSize: 12,fontWeight: FontWeight.w500),),
                              SizedBox(width: 15,),
                              Image.asset("assets/images/ic-arrow-right-colored.png"),
                              SizedBox(width: 10,),
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
                                child: Image.asset("assets/images/ic-mail.png"),
                              ),
                              SizedBox(width: 15,),

                              Text("Email",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                              Spacer(),

                              Text("${provider.userProfile!=null?provider.userProfile!.email:"No email"}",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),
                              SizedBox(width: 15,),
                              Image.asset("assets/images/ic-arrow-right-black.png"),
                              SizedBox(width: 10,),
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
                                child: Image.asset("assets/images/ic-phone.png"),
                              ),
                              SizedBox(width: 15,),

                              Text("mobile",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                              Spacer(),

                              Text("${provider.userProfile!=null?provider.userProfile!.customerAddressViewModel!.phoneNumber:"No Number"}",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),
                              SizedBox(width: 15,),
                              Image.asset("assets/images/ic-arrow-right-black.png"),
                              SizedBox(width: 10,),
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
                                child: Image.asset("assets/images/ic-lock.png"),
                              ),
                              SizedBox(width: 15,),

                              Text("Password",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                              Spacer(),

                              Text("${provider.userProfile!=null?provider.userProfile!.password:"No name"}",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),
                              SizedBox(width: 15,),
                              Image.asset("assets/images/ic-arrow-right-black.png"),
                              SizedBox(width: 10,),
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
                                child: Image.asset("assets/images/ic-otp.png"),
                              ),
                              SizedBox(width: 15,),

                              Text("Enable Otp",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                              Spacer(),

                              FlutterSwitch(
                                height: 25.0,
                                width: 45.0,
                                padding: 4.0,
                                toggleSize: 18.0,
                                borderRadius: 10.0,
                                activeColor: AppColors.primary,
                                value: isToggled,
                                onToggle: (value) {
                                  setState(() {
                                    isToggled = value;
                                  });
                                },
                              ),

                              SizedBox(width: 15,),
                              Image.asset("assets/images/ic-arrow-right-black.png"),
                              SizedBox(width: 10,),
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
                                child: Image.asset("assets/images/ic-notification.png"),
                              ),
                              SizedBox(width: 15,),

                              Text("Receive Notifications via Email",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                              Spacer(),

                              FlutterSwitch(
                                height: 25.0,
                                width: 45.0,
                                padding: 4.0,
                                toggleSize: 18.0,
                                borderRadius: 10.0,
                                activeColor: AppColors.primary,
                                value: isToggled_notification,
                                onToggle: (value) {
                                  setState(() {
                                    isToggled_notification = value;
                                  });
                                },
                              ),

                              SizedBox(width: 15,),
                              Image.asset("assets/images/ic-arrow-right-black.png"),
                              SizedBox(width: 10,),
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
                                child: Image.asset("assets/images/ic-location.png"),
                              ),
                              SizedBox(width: 15,),

                              Text("Delivery Address",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                              Spacer(),


                              Image.asset("assets/images/ic-arrow-right-black.png"),
                              SizedBox(width: 10,),
                            ],
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