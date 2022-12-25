import 'dart:async';

import 'package:flutter/material.dart';
import 'package:near_expiry/utils/nav_utils.dart';
import 'package:near_expiry/view/shop-category/shop-category.dart';

class SpashScreen extends StatelessWidget{



  @override
  Widget build(BuildContext context) {

    Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShopCategory()),
        ));

    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [

              Transform.translate(
                offset: Offset(-100,250),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/shadow-logo.png"),
                      )
                  ),
                ),
              ),
              Center(child: Image.asset("assets/images/logo-active.png"),)
            ],
          ),
        ),
    );

  }

}