import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:near_expiry/app-colors/app-colors.dart';

import 'model/my-orderlist-responsedata.dart';
import 'model/my-orderlist-responsedata.dart' as obj;


class MyOrderDetails extends StatefulWidget{

  List<InvoiceDetailsViewModel> invoiceDetailsViewModels;
  obj.InvoiceViewModel  invoiceviewmodel;
  MyOrderDetails(this.invoiceDetailsViewModels,this.invoiceviewmodel);

  @override
  State<MyOrderDetails> createState() => _MyOrderDetailsState();
}

class _MyOrderDetailsState extends State<MyOrderDetails> {
  String? selectLocationAppbar;

  List<String>locationString=["Dubai","Arab Amirat","Abudabi"];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customappbar(context),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.invoiceDetailsViewModels.length>0?widget.invoiceDetailsViewModels.length:0,
              itemBuilder: (ctx,i){
                return Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding:EdgeInsets.all(5),
                            margin: EdgeInsets.only(left: 10,right: 10),
                            child: CachedNetworkImage(
                              imageUrl: "${widget.invoiceDetailsViewModels[i].mediumImage??""}",
                              height: 60,
                              width: 60,
                              errorWidget: (ctx,uarl,error)=>Image.asset("assets/images/item-image-large.png"),
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width:170,
                                  child: Text("${widget.invoiceDetailsViewModels[i].productName??"no Product Name available"}",style: TextStyle(color: AppColors.defaultblack,fontSize: 13),overflow: TextOverflow.ellipsis,)),
                              Container(

                                  child: Text("${widget.invoiceDetailsViewModels[i].quantity??"0"}",style: TextStyle(color: AppColors.gray8383,fontSize: 9),)),

                              Row(
                                children: [
                                  Container(

                                      child: Text("AED",style: TextStyle(color: AppColors.defaultblack,fontSize: 10),)),
                                  SizedBox(width: 5,),
                                  Container(

                                      child: Text("${widget.invoiceDetailsViewModels[i].price??"0"}",style: TextStyle(color: AppColors.primary,fontSize: 20,fontWeight: FontWeight.bold),)),
                                ],
                              ),

                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Container(

                                  child: Text("${widget.invoiceviewmodel.status}",style: TextStyle(color: AppColors.green32A83E,fontSize:9,fontWeight: FontWeight.w500),)),
                              SizedBox(height: 30,),

                            ],
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                );
              }

          )
        ],
      ),
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

              Text("My Order Details",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.w500),),
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