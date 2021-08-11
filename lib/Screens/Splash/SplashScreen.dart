import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/Routers/AppRoutes.dart';

class SplashScreen extends StatefulWidget{
  SplashScreenState createState() => new SplashScreenState();
}
class SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),() async{
      SharedPreferences preferences = await SharedPreferences.getInstance();

      if(preferences.containsKey('user') && preferences.getString('user') != null){

        Get.offAllNamed(AppRoutes.Home);
      }else{

        Get.offAllNamed(AppRoutes.Login,arguments: []);
      }
    });
  }
  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Center(
            child:Image.asset("asset/splash.gif",fit: BoxFit.cover,gaplessPlayback: true)
        ),
      ),
    );
  }
}