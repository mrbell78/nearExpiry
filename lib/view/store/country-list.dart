import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:near_expiry/app-colors/app-colors.dart';
import 'package:near_expiry/utils/nav_utils.dart';
import 'package:near_expiry/view/store/store-controller.dart';
import 'package:near_expiry/view/store/store.dart';
import 'package:provider/provider.dart';

class CountryList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Provider.of<StoreController>(context, listen: false).getAllCountryList();

   return Consumer<StoreController>(

     builder: (context,provider,child){
       return Scaffold(

         appBar: _customappbar(context),

         body: Column(
           children: [
             SizedBox(height: 20,),
             Expanded(
               child: GridView.builder(
                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                     maxCrossAxisExtent:150,
                     childAspectRatio:0.3,
                     crossAxisSpacing: 10,
                     mainAxisSpacing: 5
                 ),
                 itemBuilder: (context,index){

                   return GestureDetector(
                     onTap: (){
                       NavUtils.push(context, Store(provider.allCountryLIst[index]!.countryId,"countryWise"));
                     },
                     child: Container(
                       margin: EdgeInsets.only(left: 20,right: 20),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Container(
                             width: 80,
                             height: 80,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.all(Radius.circular(10)),
                               color: Colors.white,
                               boxShadow: [
                                 BoxShadow(
                                   color: Colors.grey.withOpacity(0.5),
                                   spreadRadius: 3,
                                   blurRadius: 2,
                                   offset: Offset(0, 3), // changes position of shadow
                                 ),
                               ],
                             ),

                             child: Center(
                               child: CachedNetworkImage(
                                 imageUrl: '${provider.allCountryLIst.length>0 && provider.allCountryLIst[index]!=null?provider.allCountryLIst[index]!.image:""}',
                                 height: 45,
                                 width: 45,
                                 fit: BoxFit.cover,
                                 errorWidget:(context, url, error)=> Image.asset("assets/images/country-istanbul.png",height: 45,width: 45,fit: BoxFit.cover,),
                               ),
                             ),
                           ),
                           SizedBox(height: 8,),

                           Text("${provider.allCountryLIst[index]!.countryName}",style: TextStyle(color: AppColors.defaultblack,fontSize: 11,fontWeight: FontWeight.w500),),
                           SizedBox(height: 4,),
                           Text("(1,417)",style: TextStyle(color: AppColors.gray8383,fontSize: 9,),),
                         ],
                       ),
                     ),
                   );

                 },

                 itemCount: provider.allCountryLIst.length,
               ),
             ),
           ],
         )

       );
     },

   );
  }

  _customappbar(context,) {
    return  AppBar(
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
              Text("Your Country Shop",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.w500),),
              Spacer(),
              Image.asset("assets/images/ic-location-appbar.png"),
              SizedBox(width: 5,),

              //Image.asset('assets/menu_icon.png', width: 30, height: 30,)
            ],

          ),
        ),
      ),


    );
  }

}