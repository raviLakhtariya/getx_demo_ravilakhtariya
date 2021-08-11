import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/Themes/AppTheme.dart';

class Customutils {

  static bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)){
      callSnackBar("Please enter valid email", true);
    }
    return true;
    //return (!regex.hasMatch(value)) ? false : true;
  }
  static bool validatePassword(String value) {
    String upperCasePattern = "(?=.*[A-Z])"; //"[A-Z]";
    String lowerCasePattern = "(?=.*[a-z])"; //"""[a-z]";
    String numaricCasePattern = "(?=.*?[0-9])"; //"\\d";
    String oneSpecialCharacterCasePattern = "(?=.*?[!@#\$&*~])";
    String lengthPattern = ".{8,}";

    RegExp regExp1 = new RegExp(upperCasePattern);
    RegExp regExp2 = new RegExp(lowerCasePattern);
    RegExp regExp3 = new RegExp(numaricCasePattern);
    RegExp regExp4 = new RegExp(oneSpecialCharacterCasePattern);
    RegExp regExp5 = new RegExp(lengthPattern);

    if (regExp1.hasMatch(value) == false) {
      callSnackBar("Please add at least one upper case", true);
    return false;
    }else if(regExp2.hasMatch(value) == false) {
      callSnackBar("Please add at least one lower case", true);

    return false;
    }else if(regExp3.hasMatch(value) == false) {
      callSnackBar("Please add at least one digit", true);

    return false;
    }else if(regExp4.hasMatch(value) == false) {

    callSnackBar("Please add at least one special character", true);
    return false;
    }else if(regExp5.hasMatch(value) == false) {
      callSnackBar("minimum length 8 needs", true);
      return false;
    }
    return true;
}
 static void callSnackBar(String tostMessage,bool error){
    Get.snackbar("","",snackPosition: SnackPosition.BOTTOM,titleText:Text("Error",style: TextStyle(color: Colors.white),),messageText:Text(
        tostMessage,style: TextStyle(color: colorWhite),),backgroundColor: error == false ? Colors.blue : Colors.red);
  }
}