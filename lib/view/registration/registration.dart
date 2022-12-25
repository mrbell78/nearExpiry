import 'package:flutter/material.dart';
import 'package:near_expiry/app-colors/app-colors.dart';
import 'package:near_expiry/view/registration/registration-controller.dart';
import 'package:near_expiry/view/registration/registration-model/body-data/registration-body.dart';
import 'package:provider/provider.dart';



class Registration extends StatefulWidget{


  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController fullName = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController mobileNumber = TextEditingController();

  TextEditingController invitationCode = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();

  bool isAggrement=false;
  bool isLoading=false;

  bool validateName = false;
  bool validatemail = false;
  bool validateNumber = false;
  bool validatepassword = false;
  bool validateConfirmpassword = false;

  String passwordString ="password Can\'t be Empty";
  String confirmpasswordString ="Confirm Password Can\'t be Empty";

  @override
  void dispose() {
    fullName.dispose();
    email.dispose();
    mobileNumber.dispose();
    password.dispose();
    confirmPassword.dispose();
    invitationCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationController>(
      builder: (BuildContext context, provider, Widget? child) {

        return  Scaffold(

            body: isLoading==false?Container(
              height: double.infinity,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Image.asset("assets/images/image-register-background.png"),
                  Positioned(
                    top: 250,
                    bottom: 10,
                    child: Container(
                      padding: EdgeInsets.only(left: 25,right: 25),
                      width: MediaQuery.of(context).size.width,
                      height:double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: AppColors.pureWhite
                      ),

                      child: ListView(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        children: [

                          Row(
                            children: [
                              Text("Welcome",style: TextStyle(color: AppColors.defaultblack,fontSize:30,fontWeight: FontWeight.bold ),),
                              SizedBox(width: 90,),
                              Container(
                                height: 53,
                                width: 53,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  border: Border.all(color: AppColors.gray6767,width: 1),
                                  color: AppColors.pureWhite,
                                ),
                                child: Center(child: Image.asset("assets/images/ic-camera.png")),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("Register to continue",style: TextStyle(color: AppColors.defaultblack,fontSize:13,fontWeight: FontWeight.w500 ),),

                              SizedBox(width: 100,),
                              Text("Upload Picture",style: TextStyle(color: AppColors.defaultblack,fontSize:9,fontWeight: FontWeight.w500 ),)
                            ],
                          ),


                          SizedBox(height: 30,),

                          Container(
                            child: Row(
                              children: [
                                Container(
                                    child:Image.asset("assets/images/ic-profile.png")

                                ),
                                SizedBox(width: 8,),
                                Text("Full Name",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: TextField(
                              controller: fullName,
                              style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                              decoration: InputDecoration(
                                  hintText: "admin",
                                  hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                                  contentPadding: EdgeInsets.all(5),
                                  errorText: validateName? 'Name Can\'t Be Empty':null
                              ),
                            ),
                          ),



                          SizedBox(height: 15,),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                    child:Image.asset("assets/images/ic-mail.png")

                                ),
                                SizedBox(width: 8,),
                                Text("Email",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: TextField(
                              controller: email,
                              style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                              decoration: InputDecoration(
                                  hintText: "admin@royex.net",
                                  hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                                  contentPadding: EdgeInsets.all(5),
                                  errorText: validatemail? 'Email Can\'t Be Empty':null
                              ),
                            ),
                          ),


                          SizedBox(height: 15,),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                    child:Image.asset("assets/images/ic-phone.png")

                                ),
                                SizedBox(width: 8,),
                                Text("Mobile Number",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: TextField(
                              controller: mobileNumber,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                              decoration: InputDecoration(
                                  hintText: "55486526",
                                  hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                                  contentPadding: EdgeInsets.all(5),
                                  errorText: validateNumber? 'Number Can\'t Be Empty':null
                              ),
                            ),
                          ),


                          SizedBox(height: 15,),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                    child:Image.asset("assets/images/ic-ok.png")

                                ),
                                SizedBox(width: 8,),
                                Text("Invitation Code  (Optional)",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: TextField(
                              controller:invitationCode,
                              style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                              decoration: InputDecoration(
                                  hintText: "41289",
                                  hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                                  contentPadding: EdgeInsets.all(5)
                              ),
                            ),
                          ),




                          SizedBox(height: 15,),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                    child:Image.asset("assets/images/ic-lock.png")

                                ),
                                SizedBox(width: 8,),
                                Text("Password",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: TextField(
                              controller: password,
                              obscureText: true,
                              autocorrect: false,
                              style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                              decoration: InputDecoration(
                                  hintText: "********",
                                  hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                                  contentPadding: EdgeInsets.all(5),
                                  errorText: validatepassword? passwordString:null
                              ),
                            ),
                          ),



                          SizedBox(height: 15,),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                    child:Image.asset("assets/images/ic-lock.png")

                                ),
                                SizedBox(width: 8,),
                                Text("Confirm Password",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: TextField(
                              controller: confirmPassword,
                              obscureText: true,
                              autocorrect: false,
                              style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                              decoration: InputDecoration(
                                  hintText: "********",
                                  hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                                  contentPadding: EdgeInsets.all(5),
                                errorText: validateConfirmpassword?confirmpasswordString:null
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),


                          Row(
                            children: [
                              isAggrement==false?
                              GestureDetector(
                                onTap:(){
                                  setState(() {
                                    if(isAggrement==false){
                                      isAggrement=true;
                                    }
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
                              ):
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    if(isAggrement==true){
                                      isAggrement=false;
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(color: AppColors.grayA0),

                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                          color: AppColors.primary
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Expanded(
                                child: Text("By signingup you agree to our "
                                    "user Agreement, Privacy Policy and Draw Terms & amp, Conditions",style: TextStyle(color: AppColors.grayA0),),
                              ),
                            ],
                          ),

                          SizedBox(height: 25,),

                          Center(
                            child: GestureDetector(
                              onTap: (){

                                setState(() {
                                  fullName.text.isEmpty? validateName=true:validateName=false;
                                  mobileNumber.text.isEmpty? validateNumber=true:validateNumber=false;
                                  email.text.isEmpty? validatemail=true:validatemail=false;
                                  password.text.isEmpty? validatepassword=true:validatepassword=false;
                                  confirmPassword.text.isEmpty? validateConfirmpassword=true:validateConfirmpassword=false;
                                });

                                if(fullName.text.isNotEmpty && mobileNumber.text.isNotEmpty && email.text.isNotEmpty && password.text.isNotEmpty){

                                  if(password.text==confirmPassword.text){
                                    validateConfirmpassword=false;
                                    validatepassword=false;
                                    var data = BodyRegistrationData(
                                        email: email.text,
                                        customerId: 0,
                                        password: password.text,
                                        phoneNo: mobileNumber.text,
                                        userName: fullName.text,
                                      createdAt: DateTime.now(),
                                      updatedAt: DateTime.now()
                                    );
                                    provider.postRegistration(data).then((value){

                                      Navigator.pop(context,true);

                                    });
                                  }else {

                                    setState(() {
                                      passwordString="password are not matched";
                                      confirmpasswordString="password are not matched";
                                      validateConfirmpassword=true;
                                      validatepassword=true;
                                    });

                                  }

                                }

                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: AppColors.defaultblack,
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                                child: Center(child: Text("Sign Up",style: TextStyle(color: AppColors.pureWhite,fontSize: 12,fontWeight: FontWeight.w500),)),
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),

                          Center(
                            child: Container(
                              child:  Text("Have an Account?",style: TextStyle(color: AppColors.defaultblack,fontSize: 12),),
                            ),
                          ),
                          Center(
                            child: Container(
                              child:  Text("Login",style: TextStyle(color: AppColors.primary,fontSize: 16,fontWeight: FontWeight.w500),),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ):Center(
              child: CircularProgressIndicator(),
            )
        );
      },

    );
  }
}