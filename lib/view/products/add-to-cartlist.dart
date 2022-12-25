
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:near_expiry/app-colors/app-colors.dart';
import 'package:near_expiry/utils/nav_utils.dart';
import 'package:near_expiry/view/products/product-controller.dart';
import 'package:near_expiry/view/profile/edit-profile.dart';
import 'package:provider/provider.dart';

import 'model/body/body-order.dart';
import 'model/body/body-remove-all-cart.dart';
import 'order-thankyou.dart';

import 'model/body/body-order.dart' as listmaker;

class AddtoCartList extends StatefulWidget{

  int custommerId;
  AddtoCartList(this.custommerId);

  @override
  State<AddtoCartList> createState() => _AddtoCartListState(custommerId);
}

class _AddtoCartListState extends State<AddtoCartList> {

  int custommerId;
  _AddtoCartListState(this.custommerId);
  String? selectLocationAppbar;


  List<String>locationString=["Dubai","Arab Amirat","Abudabi"];

  bool _isExpand=false;
  double TotalAmmount=0;

  int addressSelect=0;
  int addressId=0;

  @override
  void initState() {
    Provider.of<ProductController>(context, listen: false).getCartItems(custommerId);
    Provider.of<ProductController>(context, listen: false).getDeliveryAddress(custommerId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(

      builder: (context,provider,child){
        return Scaffold(
          appBar: _customappbar(context),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.addtoCartList.length>0? provider.addtoCartList.length:0,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: "${provider.addtoCartList[index]!.smallImage??""}",
                                  height: 55,
                                  width: 55,
                                  fit: BoxFit.contain,
                                  errorWidget: (context,url,error)=>Image.asset("assets/images/item-image-large.png",height: 55,width: 55,fit: BoxFit.contain,),
                                ),
                                SizedBox(width: 8,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height:20,
                                        width:120,
                                        child: Text("${provider.addtoCartList[index]!.productName}",style: TextStyle(color: AppColors.defaultblack,fontSize: 13),overflow: TextOverflow.ellipsis,)),
                                    Text("${provider.addtoCartList[index]!.quantity}",style: TextStyle(color: AppColors.gray8383,fontSize: 9),),

                                    RichText(
                                     text: TextSpan(
                                       children: [
                                         TextSpan(
                                             text: '${provider.addtoCartList[index]!.symbol}  ',
                                             style: TextStyle(fontSize: 10,color: AppColors.defaultblack)),
                                         TextSpan(
                                             text: '${provider.addtoCartList[index]!.price}',
                                             style: TextStyle(fontSize: 14,color: AppColors.primary,fontWeight: FontWeight.bold)),
                                       ]
                                     ),
                                   ),

                                    ],
                                ),
                                Spacer(),
                                Container(
                                  child: Row(
                                    children: [

                                      InkWell(
                                        onTap:(){

                                          setState(() {
                                            if(provider.incrementer[index]>=0){
                                              provider.incrementer[index]--;
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
                                          child: Text("${provider.incrementer[index]}",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,),)),
                                      SizedBox(width: 9,),
                                      InkWell(
                                        onTap:(){

                                          setState(() {
                                            provider.incrementer[index]+=1;
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
                                provider.isExpand[index]? Spacer():SizedBox(),
                                provider.isExpand[index]?
                                Column(
                                  children: [
                                    InkWell(
                                      onTap:()async{
                                       await  provider.deleteSingleCartItem(provider.addtoCartList[index]!.cartId).then((value) async {

                                         await provider.getCartItems(custommerId);
                                         Fluttertoast.showToast(
                                             msg: "Deleted",
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
                                        height:44,
                                        width:33,
                                        child: Center(child: Image.asset("assets/images/ic-delete.png"),),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          color: AppColors.lightRedFFF1F1
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      height:44,
                                      width:33,
                                      child: Center(child: Image.asset("assets/images/ic-edit.png"),),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          border: Border.all(color: AppColors.defaultblack),
                                        color: AppColors.pureWhite,

                                      ),
                                    ),
                                  ],
                                ):SizedBox(),
                              ],
                            ),
                          ),
                          onLongPress: (){
                            setState(() {
                              provider.isExpand[index]=true;
                            });
                          },
                          onTap: (){
                            setState(() {
                              provider.isExpand[index]=false;
                            });
                          },
                        ),
                        SizedBox(height: 10,),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20,),

                Container(
                  margin: EdgeInsets.only(left: 10,right: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.pureWhite,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15,right: 15),
                        child: Row(
                          children: [

                            Text("Shipping To",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.bold),),

                            Spacer(),
                            Container(
                              width: 119,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color: AppColors.primary,

                              ),
                              child: InkWell(

                                onTap: (){
                                 NavUtils.push(context, EditProfile(custommerId));

                                  //provider.getSameElemnt(provider.addtoCartList);
                                },

                                child: Center(
                                  child: Row(
                                    children: [
                                      SizedBox(width: 3,),
                                      Icon(Icons.add,color: AppColors.pureWhite,size: 18,),
                                      SizedBox(width: 7,),
                                      Text("Add new Address",style: TextStyle(color: AppColors.pureWhite,fontSize: 9,fontWeight: FontWeight.w500),),

                                    ],

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      ListView.builder(
                          itemCount: provider.deliveryAddresslist.length>3?3:provider.deliveryAddresslist.length>0?provider.deliveryAddresslist.length:0,
                          shrinkWrap: true,
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return addressSelect==index ?
                            InkWell(
                              onTap: (){
                               setState(() {
                                 print("CustomerAddressId: ${provider.deliveryAddresslist[index]!.customerAddressId}");
                                 addressId=provider.deliveryAddresslist[index]!.customerAddressId;
                                 addressSelect=index;
                               });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 20,right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: AppColors.primary,width: 5),
                                              borderRadius: BorderRadius.all(Radius.circular(100)),
                                              color: AppColors.pureWhite
                                          ),
                                        ),
                                        SizedBox(width: 8,),
                                        Text("${provider.deliveryAddresslist[index]?.addressType??"No Type"}",style: TextStyle(color: AppColors.defaultblack,fontSize: 13,fontWeight: FontWeight.bold),),

                                        Spacer(),
                                        Image.asset("assets/images/ic-edit.png")
                                      ],
                                    ),

                                    Container(
                                        margin: EdgeInsets.only(left: 25,right: 25),
                                        child: Text("${provider.deliveryAddresslist.length>0?provider.deliveryAddresslist[index]!.address:"No Name"}",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.bold),)),

                                    Container(
                                      margin: EdgeInsets.only(left: 25,right: 25),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/images/ic-location.png"),
                                          SizedBox(width: 5,),

                                          Container(
                                              width: 160,
                                              child: Text("G3, New City Build, Ground Floor,Jumera Lake Lower, Dubai",style: TextStyle(color: AppColors.gray8383,fontSize: 9,),)),

                                          Spacer(),

                                          Image.asset("assets/images/ic-phone.png"),
                                          SizedBox(width: 5,),

                                          Text("${provider.deliveryAddresslist[index]?.phoneNumber??"No number"}",style: TextStyle(color: AppColors.gray8383,fontSize: 9,),),

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ):
                            InkWell(
                              onTap: (){
                               setState(() {
                                 addressSelect=index;
                                 addressId=provider.deliveryAddresslist[index]!.customerAddressId;
                               });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 20,right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                Container(
                                height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.gray8383,width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(100)),
                                      color: AppColors.pureWhite
                                  ),
                                ),
                                        SizedBox(width: 8,),
                                        Text("${provider.deliveryAddresslist[index]?.addressType??"No Type"}",style: TextStyle(color: AppColors.defaultblack,fontSize: 13,fontWeight: FontWeight.bold),),

                                        Spacer(),
                                        Image.asset("assets/images/ic-edit.png")
                                      ],
                                    ),

                                    Container(
                                        margin: EdgeInsets.only(left: 25,right: 25),
                                        child: Text("${provider.deliveryAddresslist.length>0?provider.deliveryAddresslist[index]!.address:"No Name"}",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.bold),)),

                                    Container(
                                      margin: EdgeInsets.only(left: 25,right: 25),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/images/ic-location.png"),
                                          SizedBox(width: 5,),

                                          Container(
                                              width: 160,
                                              child: Text("G3, New City Build, Ground Floor,Jumera Lake Lower, Dubai",style: TextStyle(color: AppColors.gray8383,fontSize: 9,),)),

                                          Spacer(),

                                          Image.asset("assets/images/ic-phone.png"),
                                          SizedBox(width: 5,),

                                          Text("${provider.deliveryAddresslist[index]?.phoneNumber??"No number"}",style: TextStyle(color: AppColors.gray8383,fontSize: 9,),),

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            );
                          },),
                    ],
                  )
                ),
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.pureWhite,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),

                  child:  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.gray8383,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color: AppColors.pureWhite
                        ),
                      ),
                      SizedBox(width: 8,),
                      Text("Use Different billing address",style: TextStyle(color: AppColors.defaultblack,fontSize: 13,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),

                SizedBox(height: 30,),

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
                                Text("Total Price:",style: TextStyle(color: AppColors.defaultblack,fontSize: 14,fontWeight: FontWeight.w500),),

                                SizedBox(height: 8,),

                                Row(
                                  children: [
                                    Text("AED",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,),),
                                    SizedBox(width: 6,),
                                    Text("${provider.getTotalAmmountforCheckOut(provider.addtoCartList)}",style: TextStyle(color: AppColors.primary,fontSize: 28,fontWeight: FontWeight.w500),),


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
                          InkWell(
                            onTap: () async {

                              double totalammount =provider.getTotalAmmountforCheckOut(provider.addtoCartList);



                              var data = BodyOrder(
                                invoiceMasterId: 0,
                                customerId: custommerId,
                                refNumber: null,
                                invoiceDate: null,
                                courierCharge: 0,
                                carryingCost: 0,
                                paymentMethod: 1,
                                remark: null,
                                discountCode: null,
                                discountValue: null,
                                paymentStatus: 1,

                                createdAt: null,
                                status: "",
                                cityId: 2002,
                                stateId:2022,
                                invoiceStatusId: 1,
                                invoiceRequestModels:provider.getInvoiceRequestModel(provider.addtoCartList, totalammount),
                                billingShippingAddressRequestModels: [

                                  listmaker.BillingShippingAddressRequestModels(
                                    billingShippingAddressId: 0,
                                    customerId: custommerId,
                                    countryId: 13,
                                    stateId: 2002,
                                    cityId: 2002,
                                    addressLine: "mirpur2",
                                    customerAddressId: addressId

                                  )
                                ],
                                inputFieldValueRequestModels: [],
                                paymentRequestModels: [
                                  listmaker.PaymentRequestModels(
                                    paymentId: 0,
                                    currencyId: 1,
                                    amount: 0,
                                    courierCharge: 0,
                                    paymentMethod: 1,
                                    payDate: "Date(1640196000000)",
                                    carryingCost: 0
                                  )
                                ],
                                totalAmount: totalammount,
                                receivedAmt: totalammount,
                                countryId:13,

                              );

                              if(provider.deliveryAddresslist.length>0){
                                await provider.orderCheckout(data).then((value) async {

                                  Fluttertoast.showToast(
                                      msg: "Order Confirmed",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                  var cartData=BodyRemoveAllCart(
                                    customerId: custommerId,
                                    cartId: provider.addtoCartList[0]!.cartId,
                                    tempId: await provider.getTemptId()
                                  );
                                  provider.removeAllCartList(cartData).then((value) {
                                    NavUtils.push(context, OrderThankyou());
                                  });




                                });

                              }else{
                                Fluttertoast.showToast(
                                    msg: "Please add address first",
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
                              height: 52,
                              width: 155,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color: AppColors.defaultblack
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Check Out",style: TextStyle(color: AppColors.pureWhite,fontSize: 14,fontWeight: FontWeight.w500),),
                                    SizedBox(width: 10,),
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                          color: AppColors.pureWhite
                                      ),
                                      child:  Center(child: Text("${provider.addtoCartList.length}",style: TextStyle(color: AppColors.defaultblack,fontSize: 14,fontWeight: FontWeight.w500),)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        );
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

              Text("Cart",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.w500),),
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