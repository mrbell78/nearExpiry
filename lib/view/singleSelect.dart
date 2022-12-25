import 'package:flutter/material.dart';
import 'package:near_expiry/app-colors/app-colors.dart';

class SingleSilect extends StatefulWidget{
  @override
  State<SingleSilect> createState() => _SingleSilectState();
}

class _SingleSilectState extends State<SingleSilect> {

  int selectIndex=0;

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: ListView.builder(

        itemCount: 50,
          itemBuilder: (context,index){

          return InkWell(

            onTap: (){
              print("Taped ${index}");
              setState(() {
                selectIndex=index;
              });
            },

            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 10,right: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.redAccent),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: selectIndex==index?AppColors.primary:AppColors.pureWhite
                  ),
                  child: Text("The ites is ${index+1}"),
                ),
                SizedBox(height: 10,)
              ],
            ),
          );

          }),
    );
  }
}