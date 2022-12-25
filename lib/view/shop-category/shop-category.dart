import 'package:flutter/material.dart';
import 'package:near_expiry/app-colors/app-colors.dart';
import 'package:near_expiry/utils/nav_utils.dart';
import 'package:near_expiry/view/store/country-list.dart';
import 'package:near_expiry/view/store/store.dart';

class ShopCategory extends StatefulWidget{

  @override
  _ShopCategoryState createState() => _ShopCategoryState();
}

class _ShopCategoryState extends State<ShopCategory> {


  List<String>locationString=["Dubai","Arab Amirat","Abudabi"];

  String? selectLocationAppbar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/default-background.png"),
            fit: BoxFit.cover
          )
        ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text("Shop Categories",style: TextStyle(color: AppColors.pureWhite,fontSize: 24,fontWeight: FontWeight.w500),),
          ),
          SizedBox(height: 22,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //fgdf
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    NavUtils.pushReplacement(context, Store(0,"fromShop"));
                  },
                  child: Container(
                    height: 162,
                      margin: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color:AppColors.pureWhite,
                        border: Border.all(color: AppColors.dropShadowBorder),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.dropShadow,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/ic-shop-category.png"),
                          SizedBox(height: 13.44,),
                          Text("Near Expiry Shop",style: TextStyle(color: AppColors.defaultblack,fontSize: 17,fontWeight: FontWeight.w500),)
                        ],
                      ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(

                child: InkWell(
                  onTap: (){
                    NavUtils.push(context, CountryList());
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 5),
                      height: 162,

                      decoration: BoxDecoration(
                          color:AppColors.pureWhite,
                          border: Border.all(color: AppColors.dropShadowBorder),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.dropShadow,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/ic-shop-category-second.png"),
                          SizedBox(height: 13.44,),
                          Text("Your Country Shop",style: TextStyle(color: AppColors.defaultblack,fontSize: 17,fontWeight: FontWeight.w500),)
                        ],
                      )
                  ),
                ),
              )
            ],

          ),

        ],
      )
      ),



    ));
  }

  _customappbar(context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.pureWhite,

      title: Center(
        child: Container(
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/ic-back-appbar.png"),
              Text("Store",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.w500),),
              Spacer(),
              Image.asset("assets/images/ic-location-appbar.png"),
              SizedBox(width: 5,),
              DropdownButton(
                  value: selectLocationAppbar,
                  underline: SizedBox(),
                  onChanged: (newValue){
                    setState(() {
                      selectLocationAppbar=newValue.toString();
                    });
                  },
                  items:locationString.map((e) =>
                      DropdownMenuItem(
                        value: e,
                        child:Text("$e",style: TextStyle(color: AppColors.defaultblack,fontSize:9,),),
                      )).toList())

              //Image.asset('assets/menu_icon.png', width: 30, height: 30,)
            ],

          ),
        ),
      ),


    );
  }
}