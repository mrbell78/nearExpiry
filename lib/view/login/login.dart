import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:near_expiry/app-colors/app-colors.dart';
import 'package:near_expiry/utils/nav_utils.dart';
import 'package:near_expiry/view/login/login-controller.dart';
import 'package:near_expiry/view/products/product-controller.dart';
import 'package:near_expiry/view/registration/registration.dart';
import 'package:near_expiry/view/shop-category/shop-category.dart';
import 'package:near_expiry/view/store/store-controller.dart';
import 'package:near_expiry/view/store/store.dart';
import 'package:provider/provider.dart';


class Login extends StatefulWidget{

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userName = TextEditingController();

  TextEditingController password = TextEditingController();

  bool _isRemember=false;
  bool validateName = false;
  bool validatePassword = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CustommerLoginController>(

      builder: (context,provider,child){
        return SafeArea(
          child: Scaffold(

              body: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Image.asset("assets/images/banner.png"),
                      ),
                      Container(
                        height: 30,
                        color:  AppColors.primary,
                      ),
                    ],
                  ),

                  Positioned(
                    left: 10,
                    top:120,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),

                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Welcome Back",style: TextStyle(color: AppColors.defaultblack,fontSize: 25,fontWeight: FontWeight.bold),),

                              SizedBox(width: 10,),

                              Container(
                                height: 50,
                                width: 50,
                                child: Image.asset("assets/images/profile_image.png"),
                              ),

                            ],
                          ),
                          Text("Arif",style: TextStyle(color: AppColors.defaultblack,fontSize: 12),),
                          SizedBox(height: 30,),

                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child:Icon(Icons.email,size: 15,),

                                ),
                                SizedBox(width: 8,),
                                Text("Email",style: TextStyle(color: AppColors.defaultblack),),

                              ],
                            ),
                          ),

                          Container(
                            child: TextField(
                              controller: userName,
                              decoration: InputDecoration(
                                  hintText: "admin@royex.net",
                                  hintStyle: TextStyle(color: AppColors.grayA0),
                                  contentPadding: EdgeInsets.all(5),
                                errorText: validateName?"User Name Can\'t be Empty":null
                              ),
                            ),
                          ),

                          SizedBox(height: 15,),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child:Icon(Icons.lock,size: 15,),

                                ),
                                SizedBox(width: 8,),
                                Text("Password",style: TextStyle(color: AppColors.defaultblack),),

                              ],
                            ),
                          ),

                          Container(
                            child: TextField(
                              controller: password,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  hintText: "password",
                                  hintStyle: TextStyle(color: AppColors.grayA0),
                                  contentPadding: EdgeInsets.all(5),
                                errorText: validatePassword?"password Can\'t be Empty":null
                              ),
                            ),
                          ),

                          SizedBox(height: 15,),

                          Row(
                            children: [
                             _isRemember==true? GestureDetector(
                                onTap:(){

                                  setState(() {
                                   _isRemember=false;
                                  });

                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(color: AppColors.grayA0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(100)),
                                        color: AppColors.primary
                                      ),
                                    ),
                                  ),
                                ),
                              ):
                             GestureDetector(
                               onTap:(){

                               setState(() {
                                 _isRemember=true;
                               });
                               },
                               child: Container(
                                 height: 20,
                                 width: 20,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.all(Radius.circular(5)),
                                   border: Border.all(color: AppColors.grayA0),
                                 ),
                               ),
                             ),



                              SizedBox(width: 8,),
                              Text("Remember Me",style: TextStyle(color: AppColors.grayA0),),
                              Spacer(),
                              Text("Forgot Password",style: TextStyle(color: AppColors.grayA0),),

                            ],
                          ),
                          SizedBox(height: 25),
                          Center(
                            child: GestureDetector(
                              onTap: ()async{
                                setState(() {
                                  userName.text.isEmpty? validateName=true:validateName=false;
                                  password.text.isEmpty? validatePassword=true:validatePassword=false;
                                });

                                if(userName.text.isNotEmpty && password.text.isNotEmpty){

                                 await  provider.postLogin(userName.text,password.text,_isRemember).then((value) {
                                   print("the value is $value");
                                   Provider.of<StoreController>(context, listen: false).getUserData();
                                   Provider.of<ProductController>(context, listen: false).getUserData();
                                   Fluttertoast.showToast(
                                       msg: "Login Success",
                                       toastLength: Toast.LENGTH_SHORT,
                                       gravity: ToastGravity.CENTER,
                                       timeInSecForIosWeb: 1,
                                       backgroundColor: Colors.red,
                                       textColor: Colors.white,
                                       fontSize: 16.0
                                   );
                                   Navigator.pop(context,true);

                                 });
                                }

                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                                child: Center(child: Text("Login",style: TextStyle(color: AppColors.pureWhite),)),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Center(
                            child: Container(
                              child:  Text("Dont Have Account ?",style: TextStyle(color: AppColors.grayA0),),
                            ),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: (){
                                NavUtils.push(context, Registration());
                              },
                              child: Container(
                                child:  Text("Register",style: TextStyle(color: AppColors.defaultblack,fontSize: 18),),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Center(
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                color: AppColors.pureWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(child: Text("Or",style: TextStyle(color: AppColors.grayA0),)),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Center(
                            child: Container(
                              child:  Text("Continue as",style: TextStyle(color: AppColors.grayA0),),
                            ),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: (){
                                NavUtils.pushReplacement(context, Store(30,""));
                              },
                              child: Container(
                                child:  Text("Guest",style: TextStyle(color: AppColors.primary,fontSize: 18),),
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                  )

                ],
              )
          ),
        );
      },

    );
}
}