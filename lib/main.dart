import 'package:flutter/material.dart';
import 'package:near_expiry/splash-screen/splash-screen.dart';
import 'package:near_expiry/view/login/login-controller.dart';
import 'package:near_expiry/view/login/login.dart';

import 'package:near_expiry/view/products/product-controller.dart';

import 'package:near_expiry/view/products/product-category/product-parent-category.dart';
import 'package:near_expiry/view/profile/edit-profile.dart';
import 'package:near_expiry/view/profile/my-orders.dart';
import 'package:near_expiry/view/profile/my-profile.dart';
import 'package:near_expiry/view/profile/profile-controller.dart';
import 'package:near_expiry/view/registration/registration-controller.dart';
import 'package:near_expiry/view/registration/registration.dart';
import 'package:near_expiry/view/shop-category/shop-category.dart';
import 'package:near_expiry/view/store/country-list.dart';
import 'package:near_expiry/view/store/store-controller.dart';
import 'package:near_expiry/view/store/store.dart';
import 'package:provider/provider.dart';

import 'locator/locator.dart';

void main() async{
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StoreController()),
        ChangeNotifierProvider(create: (context) => RegistrationController()),
        ChangeNotifierProvider(create: (context) => CustommerLoginController()),
        ChangeNotifierProvider(create: (context) => ProductController()),
        ChangeNotifierProvider(create: (context) => ProfileController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Near Expiry',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Poppins"
        ),
        home: SpashScreen(),
      ),
    );
  }
}

