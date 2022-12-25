import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:near_expiry/app-colors/app-colors.dart';
import 'package:near_expiry/utils/nav_utils.dart';
import 'package:near_expiry/view/products/model/body/body-add-to-cart.dart';
import 'package:near_expiry/view/products/product-controller.dart';
import 'package:near_expiry/view/products/product-details/tabbar-items/ingradients.dart';
import 'package:near_expiry/view/products/product-details/tabbar-items/rating-reviews.dart';
import 'package:near_expiry/view/products/product-details/tabbar-items/tabbar-items.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';

import '../add-to-cartlist.dart';


class ProductDetailsIndividual extends StatefulWidget{
  int quantity;
  int productId;
  int custommerId;
  ProductDetailsIndividual(this.productId,this.quantity,this.custommerId);

  @override
  _ProductDetailsIndividualState createState() => _ProductDetailsIndividualState(productId,quantity,custommerId);
}

class _ProductDetailsIndividualState extends State<ProductDetailsIndividual> with TickerProviderStateMixin {

  int productId;
  int quantity;
  int custommerId;
  _ProductDetailsIndividualState(this.productId,this.quantity,this.custommerId);
  String? selectLocationAppbar;
  List<String>locationString=["Dubai","Arab Amirat","Abudabi"];

  var _tabController;
  var bodyArray=[];
  var selectedIndex;





  int customIndex=0;
  @override
  void initState() {

    print("method initial called");
    Provider.of<ProductController>(context, listen: false).getProductDetails(productId,4,1,1,custommerId);
    Provider.of<ProductController>(context, listen: false).getRelatedProductYoumayLike(productId, 4, 1);

    //Provider.of<ProductController>(context, listen: false).selectionOperation();



    _tabController=TabController(length:3, vsync: this);

    setState(() {
      selectedIndex=0;
    });

    bodyArray=[
      Description(),
      Ingredients(),
      RatingReviews(),

    ];
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(

      builder: (context,provider,child){
        return  SafeArea(
            child: Scaffold(
          appBar: _customappbar(context),

          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16,),
                        Row(
                          children: [

                            Text("In Stock: 13",style: TextStyle(color: AppColors.defaultblack,fontSize: 13),),
                            SizedBox(width: 45,),

                            Image.asset("assets/images/ic-watch-colored.png"),
                            SizedBox(width: 2,),
                            Text("Expired on:",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),
                            Text(" 5 Sept, 2021",style: TextStyle(color: AppColors.primary,fontSize: 14,fontWeight: FontWeight.bold),),
                            Spacer(),
                            Image.asset("assets/images/ic-search.png"),
                            SizedBox(width: 17,),
                            Image.asset("assets/images/ic-love.png"),

                          ],
                        ),
                        SizedBox(height: 19,),

                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 130,

                            child:PhotoViewGallery.builder(

                              itemCount: provider.productDetails!=null?provider.productDetails!.productMasterMediaViewModels.length:0,
                              builder: (BuildContext context, int i){


                                return PhotoViewGalleryPageOptions(

                                  imageProvider: NetworkImage(provider.skuRequestModel!=null?provider.skuRequestModel!.mediumImage:""),
                                  initialScale: PhotoViewComputedScale.contained,
                                  heroAttributes: PhotoViewHeroAttributes(tag: provider.skuRequestModel!=null?provider.skuRequestModel!.mediumImage:""),
                                );
                              },

                              loadingBuilder: (context, event) => Center(
                                child: Container(
                                  width: 20.0,
                                  height: 20.0,
                                  child: CircularProgressIndicator(),
                                ),
                              ),


                            )
                          ),
                        ),
                        SizedBox(height: 22,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap:(){
                                for(int i =provider.productDetails!.productSubSkuRequestModels.length;i>0;i--){

                                  setState(() {

                                    provider.skuRequestModel=provider.productDetails!.productSubSkuRequestModels[i];

                                  });

                                }
                              },

                                child: Image.asset("assets/images/ic-back-appbar.png",height: 12,width: 17,)),
                            SizedBox(width: 9,),
                            Container(
                              height: 50,
                              width: 195,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: provider.productDetails!=null && provider.productDetails!.productSubSkuRequestModels.length>0?provider.productDetails!.productSubSkuRequestModels.length:0,
                                  itemBuilder: (context,index){
                                    return Container(
                                      height: 47,
                                      width: 47,
                                      margin:  EdgeInsets.all(5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        child: CachedNetworkImage(
                                            imageUrl: "${provider.productDetails!=null?provider.productDetails!.productSubSkuRequestModels[index].mediumImage:""}",
                                          errorWidget: (context,url,error)=> Container(
                                            margin: EdgeInsets.all(5),
                                            height: 47,
                                            width: 47,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                border: Border.all(color: AppColors.primary)
                                            ),
                                            child: Image.asset("assets/images/item-image-large.png",height: 46,width: 46),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(width: 9,),
                            RotatedBox(
                                quarterTurns:2,
                                child: InkWell(
                                    onTap: (){


                                      for(int i =0;i<provider.productDetails!.productSubSkuRequestModels.length;i++){

                                        setState(() {

                                          provider.skuRequestModel=provider.productDetails!.productSubSkuRequestModels[i];

                                        });

                                      }



                                    },
                                    child: Image.asset("assets/images/ic-back-appbar.png",height: 12,width: 17,))),

                          ],
                        ),

                        SizedBox(height: 40,),

                        Row(
                          children: [
                            Container(
                                width: 263,
                                child: Text("${provider.productDetails!=null?provider.productDetails!.productName:"Name Not Available"}",style: TextStyle(color: AppColors.defaultblack,fontSize: 21,fontWeight: FontWeight.w500),)),
                            Spacer(),
                            Text("NES: 629110375",style: TextStyle(color: AppColors.lightgrey,fontSize: 10,),),


                          ],
                        ),

                        SizedBox(height: 7,),

                        Row(
                          children: [
                            Text("3.78 lt",style: TextStyle(color: AppColors.lightgrey,fontSize: 12,),),
                            SizedBox(width: 15,),
                            Container(
                              height: 11,
                              width: 11,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                color: AppColors.lightgreyThin,
                              ),
                              child: Center(
                                child: Icon(Icons.info_sharp,color: AppColors.pureWhite,size: 11,),
                              ),
                            ),
                            Spacer(),
                            Container(
                              width:42,
                              height: 19,
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
                            SizedBox(width: 6,),
                            Text("(172 Review)",style: TextStyle(color: AppColors.lightgrey,fontSize: 9),),



                          ],
                        ),

                        SizedBox(height: 20,),

                        Row(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("${provider.skuRequestModel!=null?provider.skuRequestModel!.symbol:"AED"}",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,),),
                                      SizedBox(width: 6,),
                                      Text("${provider.skuRequestModel!=null?provider.skuRequestModel!.price:0}",style: TextStyle(color: AppColors.primary,fontSize: 28,fontWeight: FontWeight.w500),),
                                      SizedBox(width: 9,),
                                      provider.skuRequestModel!=null && provider.skuRequestModel!.previousPrice!=null?  Text("${provider.skuRequestModel!.symbol??"AED"}",style: TextStyle(color: AppColors.lightgrey,fontSize: 18,),):SizedBox(),
                                      SizedBox(width: 5,),
                                      provider.skuRequestModel!=null && provider.skuRequestModel!.previousPrice!=null? Text("${provider.skuRequestModel!.previousPrice??0}",style: TextStyle(color: AppColors.lightgrey,fontSize: 18,decoration: TextDecoration.lineThrough,),):SizedBox(),

                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Text("(All prices include VAT)",style: TextStyle(color: AppColors.lightgrey,fontSize: 10,),),
                                ],
                              ),
                            ),
                            SizedBox(width: 32,),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10,top: 10),
                                height: 50,
                                width: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: AppColors.lightBlueThin,
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 150,
                                      child: Row(
                                        children: [
                                          Text("GET IT BUY",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,),),
                                          SizedBox(width: 5,),
                                          Text("Today 4 PM - 6 PM",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,fontWeight: FontWeight.w500),),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      width: 150,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                width:75,
                                                child: Text("Free Delivery",style: TextStyle(color: AppColors.primary,fontSize: 9,fontWeight: FontWeight.bold),)),
                                          ),

                                          Expanded(
                                            child: Container(
                                                width: 75,
                                                child: Text("Above 30 AED For Groceries.",style: TextStyle(color: AppColors.defaultblack,fontSize: 9,fontWeight: FontWeight.bold),overflow: TextOverflow.clip,softWrap: false,)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 31,),

                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: provider.productDetails!=null && provider.productDetails!.attributeRequestModels.length>0?provider.productDetails!.attributeRequestModels.length:0,

                            itemBuilder: (context,index){


                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Select ${ provider.productDetails!.attributeRequestModels[index].attributeTitle}",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w500),),

                                  SizedBox(height: 13,),

                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:50,
                                    child: ListView.builder(


                                      itemBuilder: (context,i){


                                      /*  provider.getskuePrice(
                                          provider.productDetails!.attributeRequestModels[index].skuInitials,
                                          provider.productDetails!.attributeRequestModels[index].attributeDetailsRequestModels[i].value,


                                        );
*/

                                        return

                                          Row(
                                          children: [

                                            InkWell(
                                              onTap:(){
                                                setState(() {

                                                 provider.skqueinit[index]=provider.productDetails!.attributeRequestModels[index].skuInitials;
                                                  provider.skquvalue[i]=provider.productDetails!.attributeRequestModels[index].attributeDetailsRequestModels[i].value;

                                                 provider.getskuePrice(
                                                   index,i
                                                 );

                                                  provider.singleTry[index]=i;
                                                });
                                              },
                                              child: Container(
                                                height: 33,
                                                width: 57,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  border: Border.all(color: AppColors.DeepGray),
                                                  color:  provider.singleTry[index]==i?AppColors.primary:AppColors.pureWhite,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColors.dropShadow.withOpacity(0.2),
                                                      spreadRadius: 1,
                                                      blurRadius: 1,
                                                      offset: Offset(0, 1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),

                                                child: Center(
                                                  child:Text("${provider.productDetails!.attributeRequestModels[index].attributeDetailsRequestModels[i].value}",style: TextStyle(color:  provider.singleTry[index]==i?AppColors.pureWhite:AppColors.defaultblack,fontSize: 11,),),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                          ],
                                        );
                                      },
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemCount:provider.productDetails!.attributeRequestModels[index].attributeDetailsRequestModels.length??0,

                                    ),
                                  ),

                                  SizedBox(height: 25,),
                                ],
                              );
                            }),



                        SizedBox(height: 40,),

                        Row(
                          children: [
                            Image.asset("assets/images/ic-location-appbar.png",height: 14,width: 11,fit: BoxFit.cover,),
                            SizedBox(width: 7,),

                            Text("Country of Origin: Dubai",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,),),

                          ],
                        ),

                        SizedBox(height: 36,),

                        Row(
                          children: [
                            Text("Sold By:",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w500),),

                            SizedBox(width: 5,),
                            Text("${provider.productDetails!=null?provider.productDetails!.supplierRequestModel.supplierName:"N/A"}",style: TextStyle(color: AppColors.defaultblack,fontSize: 16,fontWeight: FontWeight.bold),),

                          ],
                        ),

                        SizedBox(height: 37,),

                        Container(


                          child: TabBar(

                              indicatorColor: AppColors.primary,
                              unselectedLabelColor: AppColors.defaultblack,
                              labelColor: AppColors.primary,

                              indicator: UnderlineTabIndicator(
                                  borderSide: BorderSide(width: 2.0,color: AppColors.primary,),
                                  insets: EdgeInsets.symmetric(horizontal: 18)),

                              isScrollable: true,
                              labelStyle: TextStyle(color:AppColors.primary,fontSize: 13,fontFamily: "Poppins",), //For Selected tab
                              unselectedLabelStyle: TextStyle(color:AppColors.defaultblack,fontSize: 13,fontFamily: "Poppins",),
                              onTap: (index) {
                                setState(() {
                                  selectedIndex=index;
                                });
                              },
                              tabs: [
                                Tab(
                                  text: "Description",
                                ),

                                Tab(
                                  text: "Ingredients",
                                ),

                                Tab(
                                  text: "Rating And Review",
                                ),


                              ],
                              controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.tab),
                        ),

                        SizedBox(height:6,),
                        bodyArray[selectedIndex],
                        SizedBox(height: 43,),

                        Row(
                          children: [
                            Text("You May Also Like",style: TextStyle(color: AppColors.defaultblack,fontSize: 18,fontWeight: FontWeight.w500),),
                            Spacer(),
                            Text("View all",style: TextStyle(color: AppColors.primary,fontSize: 10,fontWeight: FontWeight.w500),),




                          ],
                        ),

                        SizedBox(height: 15,),

                        provider.relatedProductList.length>0?  Container(
                          height: 260,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: provider.relatedProductList.length>0?provider.relatedProductList.length:0,
                              itemBuilder: (context,j){
                                return Container(
                                  margin: EdgeInsets.only(right: 10),

                                  width: 160,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(color: AppColors.primary),
                                      color: AppColors.pureWhite
                                  ),

                                  child: Container(
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    child: Column(
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
                                            Image.asset("assets/images/ic-love.png"),

                                          ],
                                        ),
                                        SizedBox(height: 2,),
                                        CachedNetworkImage(
                                            imageUrl: "${ provider.relatedProductList.length>0? provider.relatedProductList[j]:""}",
                                        height: 49,
                                        width: 97,
                                        errorWidget: (ctx,url,error)=>Image.asset("assets/images/item-image-large.png",width: 49,height: 97,),
                                        ),
                                        SizedBox(height: 11,),

                                        Container(
                                          padding: EdgeInsets.all(3),
                                          height: 60,
                                          child: Center(

                                              child: Text("${ provider.relatedProductList[j]!.productName}",style: TextStyle(color: AppColors.defaultblack,fontSize: 13,),)),
                                        ),

                                        SizedBox(height: 2,),

                                        Row(
                                          children: [
                                           /* Center(
                                                child: Text("Brand: ${ provider.relatedProductList[j].}",style: TextStyle(color: AppColors.lightgrey,fontSize: 9,),)),*/
                                            Spacer(),
                                            Icon(Icons.info,size: 9,color: AppColors.lightgreyThin,)
                                          ],
                                        ),

                                        Spacer(),

                                        Row(
                                          children: [
                                            Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("${ provider.relatedProductList[j]!.productSubSkuRequestModels[0].symbol}",style: TextStyle(color: AppColors.defaultblack,fontSize: 8,),),
                                                      SizedBox(width: 3,),
                                                      Text("${provider.relatedProductList[j]!.productSubSkuRequestModels[0].price}",style: TextStyle(color: AppColors.primary,fontSize: 16,fontWeight: FontWeight.w500),),
                                                    ],
                                                  ),
                                                  SizedBox(height: 3,),
                                                  Row(
                                                    children: [
                                                      Text("${provider.relatedProductList[j]!.productSubSkuRequestModels[0].symbol}",style: TextStyle(color: AppColors.lightgrey,fontSize: 9,),),
                                                      SizedBox(width: 3,),
                                                      Text("${provider.relatedProductList[j]!.productSubSkuRequestModels[0].previousPrice}",style: TextStyle(color: AppColors.lightgrey,fontSize: 9,decoration:TextDecoration.lineThrough,),),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
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


                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8,),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ):SizedBox(),

                      ],
                    ),
                  ),
                ),

                SizedBox(height: 31,),

                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height:120,
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlueDropShadow,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Total Price",style: TextStyle(color: AppColors.defaultblack,fontSize: 14,fontWeight: FontWeight.w500),),

                                SizedBox(height: 8,),

                                Row(
                                  children: [
                                    Text("AED",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,),),
                                    SizedBox(width: 6,),
                                    Text(" ${provider.productDetails!=null?(provider.productDetails!.productSubSkuRequestModels.length>0?provider.productDetails!.productSubSkuRequestModels[0].price:0)*quantity:0}",style: TextStyle(color: AppColors.primary,fontSize: 28,fontWeight: FontWeight.w500),),


                                  ],
                                ),
                                SizedBox(height: 9,),

                                Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("(All prices include VAT)",style: TextStyle(color: AppColors.lightgrey,fontSize: 10,),)),

                              ],
                            ),
                          ),
                          SizedBox(width: 50,),
                          Container(
                            child: VerticalDivider(width: 1,color: AppColors.grayA0,),
                          ),
                          SizedBox(width: 50,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Quantity:",style: TextStyle(color: AppColors.defaultblack,fontSize: 14,fontWeight: FontWeight.w500),),

                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        setState(() {
                                          if(quantity>0){
                                            quantity--;
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(8)),
                                            border: Border.all(color: AppColors.defaultblack),
                                            color: AppColors.pureWhite
                                        ),
                                        child: Center(child: Icon(Icons.remove,color: AppColors.defaultblack,size: 15,)) ,
                                      ),
                                    ),

                                    SizedBox(width: 6,),

                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          color: AppColors.pureWhite
                                      ),
                                      child: Center(child:  Text("${quantity}",style: TextStyle(color: AppColors.defaultblack,fontSize: 14,),),
                                      ) ,
                                    ),

                                    SizedBox(width: 6,),

                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(8)),
                                            border: Border.all(color: AppColors.defaultblack),
                                            color: AppColors.primary
                                        ),
                                        child: Center(child: Icon(Icons.add,color: AppColors.pureWhite,size: 15,)) ,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: -1,
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
                            color: AppColors.defaultblack
                        ),
                        child: Center(child:Icon(Icons.clear,color: AppColors.pureWhite,size: 10,)),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 21,),

                Row(
                  children: [
                    SizedBox(width: 20,),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          var data = BodyAddtoCart(
                              customerId:custommerId,
                              cartId: 0,
                              currencyId: 1,
                              productMasterId: provider.productDetails!.productMasterId,
                              productSubSKUId: provider.productDetails!.productSubSkuRequestModels[0].productSubSkuId,
                              quantity: quantity,
                              serviceDateTime:  provider.productDetails!.productDetailsRequestModel.serviceDateTime,
                              status: "ok",
                              storeId: provider.productDetails!.storeId,
                              supplierId: provider.productDetails!.supplierRequestModel.supplierId,
                              tempId: await provider.getTemptId(),
                              unitPrice:  provider.productDetails!.productSubSkuRequestModels[0].price.floor(),
                          inputFieldValueRequestModels:[],
                          );

                          await provider.addToCart(data).then((value) => {

                          Fluttertoast.showToast(
                          msg: "product added",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                          ),
                          NavUtils.push(context, AddtoCartList(custommerId))

                          });
                        },
                        child: Container(
                          height: 52,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.primary,

                          ),

                          child: Center(child: Text("Buy now",style: TextStyle(color: AppColors.pureWhite,fontSize: 14,fontWeight: FontWeight.w500),),),
                        ),
                      ),
                    ),
                    SizedBox(width: 14,),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          var data = BodyAddtoCart(
                              customerId:custommerId,
                              cartId: 0,
                              currencyId: 1,
                              productMasterId: provider.productDetails!.productMasterId,
                              productSubSKUId: provider.productDetails!.productSubSkuRequestModels[0].productSubSkuId,
                              quantity: quantity,
                              serviceDateTime:  provider.productDetails!.productDetailsRequestModel.serviceDateTime,
                              status: "ok",
                              storeId: provider.productDetails!.storeId,
                              supplierId: provider.productDetails!.supplierRequestModel.supplierId,
                              tempId: await provider.getTemptId(),
                              unitPrice:  provider.productDetails!.productSubSkuRequestModels[0].price.floor(),
                          inputFieldValueRequestModels:[],
                          );

                          await provider.addToCart(data).then((value) => {

                          Fluttertoast.showToast(
                          msg: "product added",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                          ),
                            NavUtils.push(context, AddtoCartList(custommerId))

                          });
                        },
                        child: Container(
                          height: 52,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.defaultblack,

                          ),

                          child: Center(child: Text("Add to cart",style: TextStyle(color: AppColors.pureWhite,fontSize: 14,fontWeight: FontWeight.w500),),),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                  ],
                ),

                SizedBox(height: 20,),
              ],
            ),
          ),

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

              Text("Product Details",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.w500),),
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


              //Image.asset('assets/menu_icon.png', width: 30, height: 30,)
            ],

          ),
        ),
      ),


    );
  }
}