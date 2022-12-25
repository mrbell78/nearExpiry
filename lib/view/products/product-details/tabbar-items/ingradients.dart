import 'package:flutter/material.dart';
import 'package:near_expiry/app-colors/app-colors.dart';

class Ingredients extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.pureWhite,
        boxShadow: [
          BoxShadow(
            color: AppColors.dropShadow.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],


      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Text("Brand:",style: TextStyle(color: AppColors.defaultblack,fontSize: 11,fontWeight: FontWeight.w500),),
              SizedBox(width: 5,),
              Text("MAC:",style: TextStyle(color: AppColors.lightgrey,fontSize: 11,),),

            ],
          ),
          SizedBox(height: 15,),


          Row(
            children: [
              Text("Brand:",style: TextStyle(color: AppColors.defaultblack,fontSize: 11,fontWeight: FontWeight.w500),),
              SizedBox(width: 5,),
              Text("MAC:",style: TextStyle(color: AppColors.lightgrey,fontSize: 11,),),

            ],
          ),
          SizedBox(height: 15,),


          Row(
            children: [
              Text("Brand:",style: TextStyle(color: AppColors.defaultblack,fontSize: 11,fontWeight: FontWeight.w500),),
              SizedBox(width: 5,),
              Text("MAC:",style: TextStyle(color: AppColors.lightgrey,fontSize: 11,),),

            ],
          ),
          SizedBox(height: 15,),


          Row(
            children: [
              Text("Brand:",style: TextStyle(color: AppColors.defaultblack,fontSize: 11,fontWeight: FontWeight.w500),),
              SizedBox(width: 5,),
              Text("MAC:",style: TextStyle(color: AppColors.lightgrey,fontSize: 11,),),

            ],
          ),
          SizedBox(height: 15,),


          Row(
            children: [
              Text("Brand:",style: TextStyle(color: AppColors.defaultblack,fontSize: 11,fontWeight: FontWeight.w500),),
              SizedBox(width: 5,),
              Text("MAC:",style: TextStyle(color: AppColors.lightgrey,fontSize: 11,),),

            ],
          ),
          SizedBox(height: 15,),


          Row(
            children: [
              Text("Brand:",style: TextStyle(color: AppColors.defaultblack,fontSize: 11,fontWeight: FontWeight.w500),),
              SizedBox(width: 5,),
              Text("MAC:",style: TextStyle(color: AppColors.lightgrey,fontSize: 11,),),

            ],
          ),

          SizedBox(height: 20,),
          Text("View more",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,fontWeight: FontWeight.w500),),
          SizedBox(height: 21,),
        ],
      ),

    );
  }

}