import 'package:flutter/material.dart';
import 'package:near_expiry/app-colors/app-colors.dart';
import 'package:near_expiry/utils/nav_utils.dart';
import 'package:near_expiry/view/products/product-controller.dart';
import 'package:near_expiry/view/products/product-details/product-details.dart';
import 'package:provider/provider.dart';

import 'model/product-details.dart';


class AllProducts extends StatefulWidget{
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {


  String? selectLocationAppbar;
  List<String>locationString=["Dubai","Arab Amirat","Abudabi"];

  @override
  void initState() {
    Provider.of<ProductController>(context, listen: false).getProducts(4,1,1,1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      appBar: _customappbar(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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

            SizedBox(height: 20,),

            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              height: 209,
              child: ListView.builder(
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                  itemCount: 10,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){

                        print("the index value is $index");
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 13),

                          child: Image.asset("assets/images/banner.png")),
                    );
                  }),
            ),
            SizedBox(height: 23,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: Text("Recently Order Items",style: TextStyle(color: AppColors.defaultblack,fontSize: 18,fontWeight: FontWeight.w500),),

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

                  itemCount: 10,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                      //  NavUtils.push(context, ProductDetailsIndividual());
                        //print("index value is........$index");
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 13),
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

                              Image.asset("assets/images/item-image-large.png",height: 47,width: 32,),
                              SizedBox(height: 9,),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: AppColors.defaultblack,
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                ),

                                child: Center(child: Icon(Icons.add,color: AppColors.pureWhite,size: 7,),),
                              ),
                            ],
                          )),
                    );
                  }),
            ),

            SizedBox(height: 30,),

            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: GridView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.8
                  ),
                  itemBuilder:(context,index){
                    return Container(

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
                            width: 98,
                            height: 78,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),

                            ),
                            child:ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                child: Image.asset("assets/images/store-image.jpg",fit: BoxFit.cover,))
                          ),
                          SizedBox(height: 6,),
                          Container(
                              margin:EdgeInsets.only(left:13),
                              child: Text("Indian Bakery",style: TextStyle(color: AppColors.defaultblack,fontSize: 14,fontWeight: FontWeight.w500),)),

                          SizedBox(height: 2,),
                          Container(
                            margin:EdgeInsets.only(left:13),
                            child: Row(
                              children: [
                                Image.asset("assets/images/ic-location-appbar.png"),
                                SizedBox(width: 3,),
                                Text("Indian",style: TextStyle(color: AppColors.lightgrey,fontSize: 7,),),


                              ],
                            ),
                          ),

                        ],
                      ),
                    );
                  } ),
            ),
          ],
        ),
      ),

    ));
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
              Image.asset("assets/images/ic-back-appbar.png"),

              Spacer(),
              SizedBox(width: 5,),

              Image.asset("assets/images/logo-top-appbar.png"),
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