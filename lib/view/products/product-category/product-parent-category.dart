import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:near_expiry/app-colors/app-colors.dart';
import 'package:near_expiry/utils/nav_utils.dart';
import 'package:near_expiry/utils/search-widget.dart';
import 'package:near_expiry/utils/shimmer-effect.dart';
import 'package:near_expiry/view/login/login.dart';
import 'package:near_expiry/view/products/model/parent-category-response-data.dart';

import 'package:near_expiry/view/products/product-controller.dart';
import 'package:near_expiry/view/products/product-details/product-details.dart';
import 'package:near_expiry/view/products/product-category/product-sub-category.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class ProductsParentCategory extends StatefulWidget{


  @override
  _ProductsParentCategoryState createState() => _ProductsParentCategoryState();
}

class _ProductsParentCategoryState extends State<ProductsParentCategory> {




  String? selectLocationAppbar;
  List<String>locationString=["Dubai","Arab Amirat","Abudabi"];


  List<ParentCategory?> parentCategoryList=[];

  @override
  void initState() {
    Provider.of<ProductController>(context, listen: false).getProductParentCategory(4);
    Provider.of<ProductController>(context, listen: false).getTrendingBanner();
    Provider.of<ProductController>(context, listen: false).getRecentlyOrderedItems(4,1,1,1);
    Provider.of<ProductController>(context, listen: false).getUserData();

    parentCategoryList= Provider.of<ProductController>(context, listen: false).parentCategoryList;
    super.initState();
  }

  String query="";
  @override
  Widget build(BuildContext context) {



    return Consumer<ProductController>(

      builder: (context,provider,child){
        return SafeArea(
            child: Scaffold(
          appBar: _customappbar(context),
          body:Stack(children: [

            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),

                  SizedBox(height: 20,),

                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    height: 209,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,

                        itemCount: provider.trendingList.length>0?provider.trendingList.length:0,
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){

                              print("the index value is $index");
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 13,top: 10),

                                height: 209,
                                width: MediaQuery.of(context).size.width,

                                child: Stack(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: "${provider.trendingList.length>0?provider.trendingList[index]!.largeImage:""}",
                                      errorWidget: (ctx,url,error)=>Image.asset("assets/images/banner.png"),
                                    ),

                                    Positioned(
                                      right: 50,
                                      bottom: 25,
                                      child: Transform.rotate(
                                        angle: math.pi / 4,
                                        child: Container(
                                          height: 85,
                                          width: 85,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColors.Deepgreen009965,width: 5),
                                            borderRadius: BorderRadius.all(Radius.circular(100))
                                          ),
                                          child: Container(
                                            height: 75,
                                            width:75,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(100)),
                                              border: Border.all(color: AppColors.pureWhite),
                                              color: AppColors.Deepgreen009965
                                            ),

                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Container(
                                                  padding: EdgeInsets.all(2),
                                                    width:40,
                                                    height: 50,
                                                    child: Center(
                                                        child: Text("${provider.trendingList[index]!.subTitle}",
                                                          style: TextStyle(color: AppColors.pureWhite,fontSize: 8,fontWeight: FontWeight.w500),)
                                                    )
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      left: 15,
                                      top: 30,
                                      child: Container(
                                        child:Text("${provider.trendingList[index]!.title}",
                                          style: TextStyle(color: AppColors.Lightyelow,fontSize: 25,fontWeight: FontWeight.bold),) ,
                                      ),
                                    ),

                                  ],
                                ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 23,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      Text("Recently Order Items",style: TextStyle(color: AppColors.defaultblack,fontSize: 18,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Container(
                    width: 50,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: Divider(height: 1,color: AppColors.primary,),

                  ),
                  SizedBox(height: 14,),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    height: 95,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,

                        itemCount: provider.recentlyOrderedItemsList.length>0?provider.recentlyOrderedItemsList.length:0,
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){

                              if(provider.custommerLogin!=null && provider.custommerLogin!.customerId!=null){
                                NavUtils.push(context,ProductDetailsIndividual(provider.recentlyOrderedItemsList[index]!.productMasterId,provider.productUnit[index],provider.custommerLogin!.customerId));
                                print("index value is........$index");
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
                            child: Container(
                              padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(right: 13,bottom: 2),
                                height: 91,
                                width: 83,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(color: AppColors.primary),
                                  color: AppColors.pureWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.dropShadow.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [

                                    CachedNetworkImage(
                                        imageUrl: "${provider.recentlyOrderedItemsList.length>0 &&
                                            provider.recentlyOrderedItemsList[index]!.productSubSkuRequestModels.length>0?
                                        provider.recentlyOrderedItemsList[index]!.productSubSkuRequestModels[0].largeImage:""}",
                                      height: 47,
                                      width: 32,
                                      fit: BoxFit.contain,
                                      errorWidget: (ctx,url,error)=>Image.asset("assets/images/item-image-large.png",height: 47,width: 32,),
                                    ),

                                    Container(
                                      padding: EdgeInsets.all(1),
                                      width: 110,
                                      child: Text("${provider.recentlyOrderedItemsList[index]!.productName}"
                                      ,style: TextStyle(color: AppColors.defaultblack,fontSize: 8,fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: AppColors.defaultblack,
                                        borderRadius: BorderRadius.all(Radius.circular(6)),
                                      ),

                                      child: Center(child: Icon(Icons.add,color: AppColors.pureWhite,size: 15,),),
                                    ),
                                  ],
                                )),
                          );
                        }),
                  ),

                  SizedBox(height: 30,),

                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,bottom: 30),


                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:  parentCategoryList.length>0?parentCategoryList.length:10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 5,
                            childAspectRatio: MediaQuery.of(context).size.height/(10*90)
                        ),
                        itemBuilder:(context,index){
                          return provider.isloading?ShimmperEffect.store(widht: 98, height: 50,shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),):
                          GestureDetector(
                            onTap: (){
                              NavUtils.push(context, ProductSubCategory(parentCategoryList[index]!.name));
                            },
                            child: Container(
                              padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: AppColors.pureWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.dropShadow.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 5), // changes position of shadow
                                  ),
                                ],
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 13,right: 13,top: 13,bottom: 0),
                                      width: 98,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),

                                      ),
                                      child:ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          child:CachedNetworkImage(
                                            width: 98,
                                            height: 50,
                                            fit: BoxFit.cover,
                                            imageUrl: '${parentCategoryList.length>0?parentCategoryList[index]!.largeImage:""}',

                                            errorWidget: (context, url, error) => Image.asset("assets/images/store-image.jpg",fit: BoxFit.cover,width: 98,
                                              height: 50,),
                                          )
                                      )
                                  ),
                                  SizedBox(height: 6,),
                                  Container(
                                      margin:EdgeInsets.only(left:13),
                                      child: Text("${parentCategoryList.length>0?parentCategoryList[index]!.name:""}",style: TextStyle(color: AppColors.defaultblack,fontSize: 14,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,)),

                                  SizedBox(height: 2,),
                                  Container(
                                    margin:EdgeInsets.only(left:13),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/images/ic-location-appbar.png"),
                                        SizedBox(width: 3,),
                                        Text("country Name",style: TextStyle(color: AppColors.lightgrey,fontSize: 7,),),


                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          );
                        } ),
                  ),

                ],
              ),
            ),

            Column(
              children: [
                SizedBox(height: 10,),
                SearchWidget(
                  text: query,
                  hintText: "Find shop or something...",
                  onChanged: findItems,
                ),
              ],
            ),
          ],)


        ));
      },
    );
  }

  _customappbar(context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.pureWhite,

      title: Center(
        child: Container(
          height: 106,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset("assets/images/ic-back-appbar.png")),

              Spacer(),
              SizedBox(width: 5,),

              Image.asset("assets/images/logo-top-appbar.png",width:110,fit: BoxFit.cover,),
              Spacer(),
              Image.asset("assets/images/ic-location-appbar.png"),
              SizedBox(width: 5,),
              Expanded(
                child: DropdownButton(
                  isExpanded: true,
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
              ),
              SizedBox(width: 5,),


              //Image.asset('assets/menu_icon.png', width: 30, height: 30,)
            ],

          ),
        ),
      ),


    );
  }

  void findItems(String query) {

    final items =  parentCategoryList.where((element) {

    final name = element!.name.toLowerCase();
    final searchlowercase = query.toLowerCase();

    print("the name ${name}");
    print("the query ${searchlowercase}");

    return name.toLowerCase().contains(searchlowercase);

    }).toList();


    setState(() {
      this.query = query;
      if(items.isNotEmpty){
        parentCategoryList=items;
      }

      if(this.query==""){
        parentCategoryList= Provider.of<ProductController>(context, listen: false).parentCategoryList;
      }
    });

  }
}