import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:near_expiry/app-colors/app-colors.dart';
import 'package:near_expiry/utils/nav_utils.dart';
import 'package:near_expiry/utils/search-widget.dart';
import 'package:near_expiry/utils/shimmer-effect.dart';
import 'package:near_expiry/view/login/login.dart';
import 'package:near_expiry/view/products/model/product-response-data.dart';

import 'package:near_expiry/view/products/product-controller.dart';
import 'package:near_expiry/view/products/product-details/product-details.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../add-to-cartlist.dart';

class ProductSubCategory extends StatefulWidget{

  String title;
  ProductSubCategory(this.title);


  @override
  State<ProductSubCategory> createState() => _ProductSubCategoryState(title);
}

class _ProductSubCategoryState extends State<ProductSubCategory> {

  String title;
  _ProductSubCategoryState(this.title);
  String? selectLocationAppbar;

  List<String>locationString=["Dubai","Arab Amirat","Abudabi"];

  List<ProductResponseData?> producNewtList=[];

  String query="";

  int isCategorySelect=-1;

  @override
  void initState() {
    Provider.of<ProductController>(context, listen: false).getProducts(4,1,1,1,);
    Provider.of<ProductController>(context, listen: false).getSubCategoryItem(4);
    Provider.of<ProductController>(context, listen: false).getUserData().then((value)
    {
      if(
      Provider.of<ProductController>(context, listen: false).custommerLogin!=null){
        Provider.of<ProductController>(context, listen: false).getCartItems(
            Provider.of<ProductController>(context, listen: false).custommerLogin!.customerId
        );
      }

    }
    );
    producNewtList=Provider.of<ProductController>(context, listen: false).productList;
    print("Total product list ${producNewtList.length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



   return Consumer<ProductController>(

     builder: (context,provider,child){
       return Scaffold(
         appBar: _customappbar(context,provider),
         body: Stack(
           children: [



             SingleChildScrollView(
               child: Column(
                 children: [
                   SizedBox(height: 70,),
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
                     children: [
                       SizedBox(width: 15,),
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

                   SizedBox(height: 14,),
                   Container(
                     margin: EdgeInsets.only(left: 20,right: 20),
                     padding: EdgeInsets.all(5),
                     height: 42,
                     child: ListView.builder(
                         shrinkWrap: true,
                         scrollDirection: Axis.horizontal,

                         itemCount: provider.subCategoryItemList.length>0?provider.subCategoryItemList.length:0,
                         itemBuilder: (context,index){
                           return Row(
                             children: [
                               isCategorySelect==index?InkWell(
                                 onTap:()async{

                                  await Provider.of<ProductController>(context, listen: false).getProducts(4,1,1,1,).then((value) {

                                    setState(() {
                                      producNewtList= provider.productList;
                                    });

                                  });
                                   setState(() {
                                     isCategorySelect=-1;
                                   });
                                 },
                                 child: Container(
                                   width: 90,
                                   height: 40,
                                   padding:EdgeInsets.all(3),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.all(Radius.circular(7)),
                                     border: Border.all(color: AppColors.primary,width: 1),
                                   ),
                                   child: Center(

                                     child: Text("${provider.subCategoryItemList[index]!.name}",
                                       style: TextStyle(color: AppColors.primary,fontSize: 11,fontWeight: FontWeight.w500),
                                       overflow: TextOverflow.ellipsis,
                                       textAlign: TextAlign.center,
                                     ),
                                   ),
                                 ),
                               ):

                               InkWell(
                                 onTap:()async{
                                   await provider.getProductsbyCategory(4, 1, 1, 1, provider.subCategoryItemList[index]!.categoryId).then((value) {

                                     setState(() {
                                       producNewtList=provider.productList;
                                     });

                                   });
                                   setState(() {
                                     isCategorySelect=index;

                                   });
                                 },
                                 child: Container(
                                   padding: EdgeInsets.all(3),
                                   width: 90,
                                   height: 40,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.all(Radius.circular(10)),
                                     color: AppColors.pureWhite,
                                     border: Border.all(color: Colors.black12.withOpacity(0.3),width: 1),

                                   ),
                                   child: Center(

                                     child: Text("${provider.subCategoryItemList[index]!.name}",
                                       style: TextStyle(color: AppColors.defaultblack,fontSize: 11,fontWeight: FontWeight.w500),
                                       overflow: TextOverflow.ellipsis,
                                     textAlign: TextAlign.center,
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(width: 10,)
                             ],
                           );
                         }),
                   ),

                   SizedBox(height: 30,),
                   Container(
                     margin: EdgeInsets.only(left: 20,right: 20),
                     child: GridView.builder(
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         itemCount: producNewtList.length>0 ?producNewtList.length:15,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2,
                             mainAxisSpacing: 12,
                             crossAxisSpacing: 2,
                             childAspectRatio:(10*43)/ (MediaQuery.of(context).size.height)
                         ),
                         itemBuilder:(context,index){
                           // provider.getUnit(provider.productList[0]!.productSubSkuRequestModels);
                           return provider.isloading?ShimmperEffect.store(widht: 160, height: 260, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),) :
                           producNewtList.length>0? GestureDetector(
                             onTap: () async {
                               await provider.getUserData().then((value){
                                 if(value==true){

                                   NavUtils.push(context, ProductDetailsIndividual( producNewtList[index]!.productMasterId, provider.productUnit[index],provider.custommerLogin!.customerId));

                                 }else{
                                   NavUtils.push(context, Login());
                                 }

                               } );

                             },
                             child: Container(
                               margin: EdgeInsets.only(right: 10),
                               height: 260,
                               width: 160,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.all(Radius.circular(8)),
                                   border: Border.all(color: AppColors.primary),
                                   color: AppColors.pureWhite
                               ),

                               child: Container(
                                 margin: EdgeInsets.only(left: 10,right: 10),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     SizedBox(height: 10,),
                                     Row(
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
                                         Image.asset("assets/images/country-istanbul.png",height: 16,width: 18,),
                                         SizedBox(width: 8,),
                                         Image.asset("assets/images/ic-love.png"),

                                       ],
                                     ),
                                     SizedBox(height: 2,),
                                     Center(
                                       child: CachedNetworkImage(
                                         imageUrl: '${producNewtList.length>0?producNewtList[index]!.productMasterMediaViewModels.length>0?producNewtList[index]!.productMasterMediaViewModels[0].fileLocation:"":""}',
                                         height: 108,
                                         width: 108,
                                         errorWidget: (context,url,error)=>Image.asset("assets/images/item-image-large.png",width: 108,height: 108,),
                                       ),
                                     ),
                                     SizedBox(height: 11,),

                                     Expanded(
                                       child: Container(
                                           margin: EdgeInsets.only(bottom: 3),
                                           child: Text("${producNewtList.length>0?producNewtList[index]!.productName:""}",style: TextStyle(color: AppColors.defaultblack,fontSize: 13,),)),
                                     ),

                                     /* Row(
                                   children: [
                                     Expanded(
                                       child: Container(

                                           child: Text("${provider.productList[index]!.productName}",style: TextStyle(color: AppColors.defaultblack,fontSize: 13,),overflow: TextOverflow.ellipsis,)),
                                     ),

                                   SizedBox(width: 10,),
                                     Icon(Icons.info,size: 9,color: AppColors.lightgreyThin,)
                                   ],
                                 ),*/

                                     SizedBox(height: 2,),


                                     Row(
                                       children: [
                                         Text("Quantity : ${producNewtList.length>0?producNewtList[index]!.productSubSkuRequestModels.length>0?provider.productList[index]!.productSubSkuRequestModels[0].quantity:0:0}",style: TextStyle(color: AppColors.lightgrey,fontSize: 9,),),
                                         Spacer(),

                                         Container(
                                           child: Row(
                                             children: [

                                               InkWell(
                                                 onTap:(){

                                                   setState(() {
                                                     if(producNewtList.length>0 && producNewtList[index]!.productSubSkuRequestModels.length>0 && provider.productList[index]!.productSubSkuRequestModels[0].quantity>0){

                                                       provider.productUnit[index]--;
                                                     }
                                                   });

                                                 },
                                                 child: Container(
                                                   height: 24,
                                                   width: 24,
                                                   decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.all(Radius.circular(8)),
                                                     color: AppColors.pureWhite,
                                                     boxShadow: [
                                                       BoxShadow(
                                                         color:AppColors.dropShadow.withOpacity(0.2),
                                                         spreadRadius:1,
                                                         blurRadius: 1,
                                                         offset: Offset(0, 1), // changes position of shadow
                                                       ),
                                                     ],
                                                   ),

                                                   child: Center(
                                                     child: Icon(Icons.remove,size: 10,color: AppColors.defaultblack,),
                                                   ),
                                                 ),
                                               ),
                                               SizedBox(width: 9,),
                                               Center(
                                                   child: Text("${provider.productUnit[index]}",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,),)),
                                               SizedBox(width: 9,),
                                               InkWell(

                                                 onTap: (){

                                                   setState(() {
                                                     if(producNewtList.length>0 && producNewtList[index]!.productSubSkuRequestModels.length>0 && provider.productList[index]!.productSubSkuRequestModels[0].quantity>provider.productUnit[index]){
                                                       provider.productUnit[index]++;
                                                     }else{
                                                       Fluttertoast.showToast(
                                                           msg: "Stock over",
                                                           toastLength: Toast.LENGTH_SHORT,
                                                           gravity: ToastGravity.CENTER,
                                                           timeInSecForIosWeb: 1,
                                                           backgroundColor: Colors.red,
                                                           textColor: Colors.white,
                                                           fontSize: 16.0
                                                       );
                                                     }
                                                   });

                                                 },
                                                 child: Container(
                                                   height: 24,
                                                   width: 24,
                                                   decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.all(Radius.circular(8)),
                                                     color: AppColors.defaultblack,
                                                     boxShadow: [
                                                       BoxShadow(
                                                         color:AppColors.dropShadow.withOpacity(0.2),
                                                         spreadRadius:1,
                                                         blurRadius: 1,
                                                         offset: Offset(0, 1), // changes position of shadow
                                                       ),
                                                     ],
                                                   ),

                                                   child: Center(
                                                     child: Icon(Icons.add,size: 10,color: AppColors.pureWhite,),
                                                   ),
                                                 ),
                                               ),


                                             ],
                                           ),
                                         ),
                                       ],
                                     ),

                                     SizedBox(height: 8,),

                                     Row(
                                       children: [
                                         Container(
                                           child: Column(
                                             children: [
                                               Row(
                                                 children: [
                                                   Text("${producNewtList.length>0?producNewtList[index]!.productSubSkuRequestModels.length>0?producNewtList[index]!.productSubSkuRequestModels[0].symbol:"AED":"AED"}",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,),),
                                                   SizedBox(width: 3,),
                                                   Text("${producNewtList.length>0?producNewtList[index]!.productSubSkuRequestModels.length>0?producNewtList[index]!.productSubSkuRequestModels[0].price:"0":"0"}",style: TextStyle(color: AppColors.primary,fontSize: 20,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                                                 ],
                                               ),
                                               SizedBox(height: 3,),
                                               producNewtList.length>0 && producNewtList[index]!.productSubSkuRequestModels.length>0 && producNewtList[index]!.productSubSkuRequestModels[0].previousPrice!=null?
                                               Row(
                                                 children: [
                                                   Text("${producNewtList[index]!.productSubSkuRequestModels[0].symbol!}",style: TextStyle(color: AppColors.lightgrey,fontSize: 10,),),
                                                   SizedBox(width: 3,),
                                                   Text("${producNewtList[index]!.productSubSkuRequestModels[0].previousPrice!}",style: TextStyle(color: AppColors.lightgrey,fontSize: 18,decoration:TextDecoration.lineThrough,),),
                                                 ],
                                               ):SizedBox(),
                                             ],
                                           ),
                                         ),

                                       ],
                                     ),



                                   ],
                                 ),
                               ),
                             ),
                           ): Center(child: Text("No Data found"),);
                         } ),
                   ),
                 ],
               ),
             ),
             Column(
               children: [
                 SizedBox(height: 15,),
                 SearchWidget(
                   text: query,
                   hintText: "Find shop or something...",
                   onChanged: findItems,
                 ),
               ],
             ),


           ],
         ),
       );
     },
   );
  }

  _customappbar(context,provider) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.pureWhite,

      title: Center(
        child: Container(
          height: 106,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset("assets/images/ic-back-appbar.png")),

              Spacer(),
              SizedBox(width: 5,),
              Text("${title}",style: TextStyle(color:AppColors.defaultblack,fontSize: 9, ),),
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

              InkWell(
                onTap: ()async{
                  provider.getUserData().then((value){

                    if(provider.custommerLogin!=null && provider.custommerLogin!.customerId!=null){
                      NavUtils.push(context, AddtoCartList(provider.custommerLogin!.customerId));
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

                  });

                },
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      child: Image.asset("assets/images/ic-cart.png"),
                    ),
                    Positioned(
                      left: 10,
                      child: provider.addtoCartList.length>0?
                      Container(
                        height: 13,
                        width: 13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: AppColors.primary,
                        ),
                        child: Center(child: Text("${provider.addtoCartList.length}",style: TextStyle(color: AppColors.pureWhite,fontSize:8 ),)),
                      ):SizedBox(),
                    ),
                  ],
                ),
              )




              //Image.asset('assets/menu_icon.png', width: 30, height: 30,)
            ],

          ),
        ),
      ),


    );

  }



  void findItems(String query) {

    final items =  producNewtList.where((element) {

      final name = element!.productName.toLowerCase();
      final searchlowercase = query.toLowerCase();

      print("the name ${name}");
      print("the query ${searchlowercase}");

      return name.toLowerCase().contains(searchlowercase);

    }).toList();


    setState(() {
      this.query = query;
      if(items.isNotEmpty){
        producNewtList=items;
      }

      if(this.query==""){
        producNewtList= Provider.of<ProductController>(context, listen: false).productList;
      }
    });

  }
}