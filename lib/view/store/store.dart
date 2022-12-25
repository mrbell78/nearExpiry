import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:near_expiry/app-colors/app-colors.dart';
import 'package:near_expiry/utils/nav_utils.dart';
import 'package:near_expiry/utils/shimmer-effect.dart';
import 'package:near_expiry/view/drawer/drawer.dart';
import 'package:near_expiry/view/login/login.dart';
import 'package:near_expiry/view/products/product-category/product-parent-category.dart';
import 'package:near_expiry/view/products/product-controller.dart';
import 'package:near_expiry/view/profile/edit-profile.dart';
import 'package:near_expiry/view/store/store-controller.dart';
import 'package:near_expiry/view/store/store-model/all-country-list-responsedata.dart';
import 'package:provider/provider.dart';


class Store extends StatefulWidget{
  int CountryId;
  String parentScreen;
  Store(this.CountryId,this.parentScreen);



  @override
  _StoreState createState() => _StoreState(CountryId,parentScreen);
}

class _StoreState extends State<Store> {


  int CountryId;
  String parentScreen;
  _StoreState(this.CountryId,this.parentScreen);

  List<String>locationString=["Dubai","Arab Amirat","Abudabi"];
  List<String>imagelist=[
    "assets/images/country-istanbul.png",
    "assets/images/country-lebanan.png",
    "assets/images/country-pakistan.png"
  ];

  String? selectLocationAppbar;
  AllCountryListResponseData? _selectCurrentCountry;
  String? selectImagelist;



  @override
  void initState() {



    if(parentScreen=="countryWise"){
      Provider.of<StoreController>(context, listen: false).getAllStoreListCountrywise(CountryId);
    }else {

      Provider.of<StoreController>(context, listen: false).getAllStoreList();
    }

    Provider.of<StoreController>(context, listen: false).getAllCountryList();





    super.initState();
  }


  @override
  void dispose() {
    print("dispose method is called");
    Provider.of<StoreController>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print("init method called");
    Provider.of<StoreController>(context, listen: false).getUserData();

    return Consumer<StoreController>(



      builder: (context,provider,child){
        return SafeArea(child: Scaffold(

          appBar: _customappbar(context,provider.countryName,provider),
          body: Column(
            children: [
              SizedBox(height: 15,),

              Container(

                margin: EdgeInsets.only(left: 20,right: 20),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.pureWhite,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.dropShadow.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Image.asset("assets/images/ic-search.png"),
                      suffixIcon: Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color:AppColors.pureBlack
                          ),
                          child: Image.asset("assets/images/ic-filter.png")),
                      hintText: "Find shop or something...",
                      hintStyle: TextStyle(color: AppColors.hintextColor,fontSize: 12),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 10,right: 20)
                  ),
                ),
              ),

              SizedBox(height: 34,),

              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: GridView.builder(

                      itemCount:provider.storeList.length>0?provider.storeList.length:15,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: MediaQuery.of(context).size.height/(10*90)
                      ),
                      itemBuilder:(context,index){
                        return provider.isloading?ShimmperEffect.store(widht: 162, height: 105,shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),):
                        GestureDetector(
                          onTap: (){
                            NavUtils.push(context, ProductsParentCategory());
                            print("the index value is....$index");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: AppColors.pureWhite,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.dropShadow.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 13,right: 13,top: 13,bottom: 0),
                                  width: 162,
                                  height: 105,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                      
                                        image: /*provider.storeList[index]!.smallImage==null?AssetImage("assets/images/store-image.jpg",):*/NetworkImage("${provider.storeList[index]!.smallImage}"),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(top: 8,left: 7),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width:32,
                                          height: 15,
                                          padding: EdgeInsets.only(top: 2.5,bottom: 3,left: 5,right: 4.5),
                                          decoration: BoxDecoration(
                                            color: AppColors.yelow,
                                            borderRadius: BorderRadius.all(Radius.circular(15)),
                                          ),
                                          child: Row(children: [
                                            Image.asset("assets/images/ic-star-white.png"),
                                            SizedBox(width: 5,),
                                            Text("4.8",style: TextStyle(color: AppColors.pureWhite,fontSize: 7,fontWeight: FontWeight.w500),),

                                          ],),
                                        ),
                                        Spacer(),

                                        CachedNetworkImage(
                                            imageUrl: "${provider.storeList[index]!.countryImage}",
                                          height: 19,
                                          width: 26,
                                          fit: BoxFit.cover,
                                          errorWidget: (context,url,error)=>Container(
                                              width: 26,
                                              height: 19,
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                                color: AppColors.pureWhite,
                                              ),
                                              child: Image.asset("assets/images/country-istanbul.png",fit: BoxFit.cover,)),
                                        ),


                                        SizedBox(width: 8,),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6,),
                                Container(
                                    margin:EdgeInsets.only(left:13),
                                    child: Text("${provider.storeList[index]!.shopName}",style: TextStyle(color: AppColors.defaultblack,fontSize: 14,fontWeight: FontWeight.w500),)),

                                SizedBox(height: 2,),
                                Container(
                                  margin:EdgeInsets.only(left:13),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/ic-location-appbar.png"),
                                      SizedBox(width: 3,),
                                      Expanded(child: Text("${provider.storeList[index]!.address}",style: TextStyle(color: AppColors.lightgrey,fontSize: 7,),overflow: TextOverflow.ellipsis,)),


                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      } ),
                ),
              ),


              Stack(
                overflow: Overflow.visible,
                children: [

                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10,bottom: 20),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(color: AppColors.primary,width: 1),

                    ),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [



                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/ic-home.png"),
                            SizedBox(height: 3,),
                            Text("Home",style: TextStyle(color: AppColors.primary,fontSize: 10,fontWeight: FontWeight.w500),),
                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/ic-category.png"),
                            SizedBox(height: 3,),
                            Text("Category",style: TextStyle(color: AppColors.primary,fontSize: 10,fontWeight: FontWeight.w500),),
                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SizedBox(height: 8,),
                            Text("Cart",style: TextStyle(color: AppColors.primary,fontSize: 10,fontWeight: FontWeight.w500),),
                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/ic-notification.png"),
                            SizedBox(height: 3,),
                            Text("Notification",style: TextStyle(color: AppColors.primary,fontSize: 10,fontWeight: FontWeight.w500),),
                          ],
                        ),

                        GestureDetector(
                          onTap: (){
                            if(provider.custommerLogin!=null && provider.custommerLogin!.customerId!=null){
                              NavUtils.push(context, DrawerCustom(provider.custommerLogin!.customerId));
                            }else{
                              Fluttertoast.showToast(
                                  msg: "you are not loged in",
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/ic-profile.png"),
                              SizedBox(height: 3,),
                              Text("Profile",style: TextStyle(color: AppColors.primary,fontSize: 10,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                  Positioned(
                    top: -28,
                    left: MediaQuery.of(context).size.width/2-32,
                    child: Container(
                      height:55,
                      width: 55,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        border: Border.all(color: AppColors.primary),
                      ),

                      child: Center(child: Image.asset("assets/images/ic-logocart.png"),),
                    ),
                  ),

                ],
              ),
            ],
          ),

        ));
      },

    );
  }

  _customappbar(context,List<String>Imagelist,provider) {
    return  AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.pureWhite,
      leading: IconButton(
        icon: Image.asset(
          'assets/images/ic-drawer.png',
          width: 20,
          height: 20,
        ),
        onPressed: () {
          if(provider.custommerLogin!=null && provider.custommerLogin!.customerId!=null){
            NavUtils.push(context, DrawerCustom(provider.custommerLogin!.customerId));
          }else{
            Fluttertoast.showToast(
                msg: "you are not loged in",
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
      ),
      title: Center(
        child: Container(
          height: 106,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              SizedBox(width: 5,),
              Text("Store",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.w500),),
              Spacer(),
              Image.asset("assets/images/ic-location-appbar.png"),
              SizedBox(width: 5,),
              DropdownButton(
                  hint: Text("Dubai",style: TextStyle(color:AppColors.defaultblack,fontSize: 9, ),),
                  value: selectLocationAppbar,
                  underline: SizedBox(),
                  icon: Image.asset("assets/images/ic-dropdown-appbar.png"),
                  onChanged: (newValue){
                    setState(() {
                      selectLocationAppbar=newValue.toString();
                    });
                  },
                  items:locationString.map((e) =>
                      DropdownMenuItem(
                        value: e,
                        child:Text("$e",style: TextStyle(color: AppColors.defaultblack,fontSize:9,),),
                      )).toList()),
              SizedBox(width: 5,),
              Expanded(
                child: DropdownButton(
                  isExpanded: true,
                    hint: Image.asset("assets/images/country-istanbul.png",height: 20,width: 20,),
                    value: selectImagelist,
                    underline: SizedBox(),
                    icon: Image.asset("assets/images/ic-dropdown-appbar.png",),
                    onChanged: (newValue){
                      setState(() {
                        selectImagelist=newValue.toString();
                      });
                    },
                    items:Imagelist.map((e) =>
                        DropdownMenuItem(
                            value: e,
                            child:Image.asset("$e",height:20,width:20,)
                        )).toList()),
              ),
              SizedBox(width: 5,)
              //Image.asset('assets/menu_icon.png', width: 30, height: 30,)
            ],

          ),
        ),
      ),


    );
  }
}