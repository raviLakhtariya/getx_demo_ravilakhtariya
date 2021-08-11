import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/Helper/Constant.dart';
import 'package:testapp/Helper/Utils.dart';
import 'package:testapp/Models/UserModel.dart';

class LoginController extends GetxController{

  var loginProcess = false.obs;
  var error = "";
  dynamic argumentData = Get.arguments;
  //User? user = User().obs;

  RxBool passwordVisible = false.obs;
  RxBool rememberCheck = false.obs;

  void updateVisibility() => passwordVisible.value = passwordVisible.value ? false : true;
  void updateRememberCheck() => rememberCheck.value = rememberCheck.value ? false : true;

  String email = "";
  String password = "";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
fetchRememberData();
  }
  fetchRememberData() async{
    loginProcess(true);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.containsKey('isRemember') == true){
     var preferenceValue = preferences.get('user');
      var object = json.decode(preferenceValue.toString());
      print(object);
      email = object["email"];
      password = object["password"];


    }
    loginProcess(false);
  }

  bool? checkvalidations({@required String? email,@required String? password}) {

    if(email!.trim().removeAllWhitespace == ""){
      Customutils.callSnackBar("Please enter email", true);
      return false;
    }else if (Customutils.validateEmail(email!.trim().removeAllWhitespace) == false){
     return false;
    }else if (password!.trim().removeAllWhitespace == ""){
      Customutils.callSnackBar("Please enter password", true);
      return false;
    }
    else if(Customutils.validatePassword(password!.trim().removeAllWhitespace) == false){
      return false;
    }
    return true;
  }

  Future<bool?> login({@required String? email,@required String? password,@required bool? isRemember}) async{
    loginProcess(true);
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if(email!.trim() == constantEmail && password!.trim() == constantPassword){
     var user = User(email: email,password: password);
      preferences.setString('user', json.encode(user));
     preferences.setBool('isRemember', isRemember ?? false);
      loginProcess(false);
      return true;
    }else{
      Customutils.callSnackBar("Login error)", true);
      loginProcess(false);
      return false;
    }

  }



}
