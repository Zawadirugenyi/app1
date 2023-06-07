import 'dart:async';
import './customwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7),
          () => Get.toNamed('/login')
    );
  }
  
  @override
  Widget build(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     Image.asset(
      'assets/images/15-removebg-preview (3).png',
      height: 620,
      width: 300,
      fit: BoxFit.contain,
     ),

      const SizedBox(
      height: 60.0,
      ),

       Center(
       child: myTextWidget(
      'COOPEC MICROTOUS', 35.0,
        Colors.indigo,),
       ),
     ],
   ),
  );
 }
}





