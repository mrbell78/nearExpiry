
import 'package:flutter/material.dart';
import 'package:near_expiry/app-colors/app-colors.dart';

class Description extends StatelessWidget{
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
          Text("Praesent ante tellus, elementum ac dolor non, tincidunt sollicitudin augue. Sed felis nibh, molestie mattis purus nec, aliquam bibendum libero. Duis eget odio pulvinar, euismod ipsum vitae, blandit ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a magna orci. Donec sed aliquam orci. Vestibulum condimentum, urna vitae lobortis euismod, risus orci tincidunt nunc, nec mattis justo urna id nunc. Mauris quis metus ut enim auctor accumsan viverra eu sapien. Praesent commodo laoreet gravida. Donec pulvinar at lorem et aliquam. Suspendisse venenatis et orci viverra.",
            style: TextStyle(color: AppColors.defaultblack,fontSize: 12,),),
          SizedBox(height: 20,),
          Text("View more",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,fontWeight: FontWeight.w500),),
          SizedBox(height: 21,),
        ],
      ),

    );
  }

}