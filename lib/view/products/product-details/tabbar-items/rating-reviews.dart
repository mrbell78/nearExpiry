import 'package:flutter/material.dart';
import 'package:near_expiry/app-colors/app-colors.dart';

class RatingReviews extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Container(
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

               Text("Good Product:",style: TextStyle(color: AppColors.defaultblack,fontSize: 13,fontWeight: FontWeight.w500),),
               SizedBox(height: 4,),
               Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis aliquet interdum. Nullam neque erat, viverra in gravidauis, tempus vitae mi.:",style: TextStyle(color: AppColors.defaultblack,fontSize: 10),),
               SizedBox(height: 8,),
               Text("By Asif Rahaman, 14 Mar, 2021",style: TextStyle(color: AppColors.lightgrey,fontSize: 8,),),
               SizedBox(height: 17,),
               Divider(height: 1,color: AppColors.lightgreyThin,),
               SizedBox(height: 16,),



               Text("Good Product:",style: TextStyle(color: AppColors.defaultblack,fontSize: 13,fontWeight: FontWeight.w500),),
               SizedBox(height: 4,),
               Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis aliquet interdum. Nullam neque erat, viverra in gravidauis, tempus vitae mi.:",style: TextStyle(color: AppColors.defaultblack,fontSize: 10),),
               SizedBox(height: 8,),
               Text("By Asif Rahaman, 14 Mar, 2021",style: TextStyle(color: AppColors.lightgrey,fontSize: 8,),),
               SizedBox(height: 17,),
               Divider(height: 1,color: AppColors.lightgreyThin,),
               SizedBox(height: 16,),



               Text("Good Product:",style: TextStyle(color: AppColors.defaultblack,fontSize: 13,fontWeight: FontWeight.w500),),
               SizedBox(height: 4,),
               Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis aliquet interdum. Nullam neque erat, viverra in gravidauis, tempus vitae mi.:",style: TextStyle(color: AppColors.defaultblack,fontSize: 10),),
               SizedBox(height: 8,),
               Text("By Asif Rahaman, 14 Mar, 2021",style: TextStyle(color: AppColors.lightgrey,fontSize: 8,),),
               SizedBox(height: 17,),
               Divider(height: 1,color: AppColors.lightgreyThin,),
               SizedBox(height: 16,),



               Text("Good Product:",style: TextStyle(color: AppColors.defaultblack,fontSize: 13,fontWeight: FontWeight.w500),),
               SizedBox(height: 4,),
               Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis aliquet interdum. Nullam neque erat, viverra in gravidauis, tempus vitae mi.:",style: TextStyle(color: AppColors.defaultblack,fontSize: 10),),
               SizedBox(height: 8,),
               Text("By Asif Rahaman, 14 Mar, 2021",style: TextStyle(color: AppColors.lightgrey,fontSize: 8,),),
               SizedBox(height: 17,),
               Divider(height: 1,color: AppColors.lightgreyThin,),
               SizedBox(height: 26,),

               Text("Expand more reviews",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,fontWeight: FontWeight.w500),),

               SizedBox(height: 20,),
             ],
           ),

         ),
         SizedBox(height: 20,),

         Row(
           children: [
             Text("Add Rating:",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w500),),

             SizedBox(width: 5,),
             Icon(Icons.star,color: AppColors.DeepGray,size: 22,),
             SizedBox(width: 7,),
             Icon(Icons.star,color: AppColors.DeepGray,size: 22,),
             SizedBox(width: 7,),
             Icon(Icons.star,color: AppColors.DeepGray,size: 22,),
             SizedBox(width: 7,),
             Icon(Icons.star,color: AppColors.DeepGray,size: 22,),


           ],
         ),
         SizedBox(height: 24,),

         Text("Add A Written Review:",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w500),),
         SizedBox(height: 16,),

         Container(
           height: 103,
           width: double.infinity,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(8)),
             border: Border.all(color: AppColors.DeepGray)
           ),
           child: TextField(
             style:TextStyle(color: AppColors.defaultblack,fontSize: 9),
             decoration: InputDecoration(
               border: InputBorder.none,
               focusedBorder: InputBorder.none,
               enabledBorder: InputBorder.none,
               errorBorder: InputBorder.none,
               disabledBorder: InputBorder.none,
               hintText: "Tell us what you like or dislike about this product",
               hintStyle: TextStyle(color: AppColors.lightgrey,fontSize: 9),
               contentPadding: EdgeInsets.only(left: 10)
             ),
           ),
         ),

         SizedBox(height: 19,),

         Text("Add Title:",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w500),),
         SizedBox(height: 8,),
         Text("Sum up your review in one line",style: TextStyle(color: AppColors.lightgrey,fontSize: 8,),),

         SizedBox(height: 11,),

         Container(
           height: 35,
           width: double.infinity,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(8)),
               border: Border.all(color: AppColors.DeepGray)
           ),
           child: TextField(
             style:TextStyle(color: AppColors.defaultblack,fontSize: 9),
             decoration: InputDecoration(
               border: InputBorder.none,
               focusedBorder: InputBorder.none,
               enabledBorder: InputBorder.none,
               errorBorder: InputBorder.none,
               disabledBorder: InputBorder.none,
               hintText: "Headline for your review",
               hintStyle: TextStyle(color: AppColors.lightgrey,fontSize: 9),
               contentPadding: EdgeInsets.only(left: 10,bottom: 12)
             ),
           ),
         ),
         SizedBox(height: 15,),

         Container(
           height: 37,
           width: 90,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(8)),
             color: AppColors.primary

           ),

           child: Center(
             child:  Text("Submit",style: TextStyle(color: AppColors.pureWhite,fontSize: 10,fontWeight: FontWeight.w500),),
           ),
         ),

       ],
     ),
   );
  }

}