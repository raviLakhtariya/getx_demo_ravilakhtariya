import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/Models/PostResponseModel.dart';
import 'package:testapp/Services/APIConstant.dart';
import 'package:testapp/Services/APIServices.dart';

class HomeController extends GetxController{

  late List<PostResponse?> arrPost = [];
  var loading = false.obs;
  var createPostLoading = false.obs;
  var error = "";
  APIServices apiServices = new APIServices();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPost();
  }
  void fetchPost() async{
    loading(true);
    SharedPreferences preferences = await SharedPreferences.getInstance();
      final response = await apiServices.get(APIConstant.postAPI);
      if(response.length > 0){
        for(int i =0;i<response.length;i++){
          arrPost.add(PostResponse.fromJson(response[i]));
        }
      }else{

      }
      // PostResponse responseJson = PostResponse.fromJson(response);
      // print(responseJson);
      // arrPost = responseJson.;

    loading(false);
  }

  Future<int?> clickLogout() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
     final preferenceValue = preferences.get('user');
     final rememberValue = preferences.getBool('isRemember');
    var object = json.decode(preferenceValue.toString());

    if(rememberValue != true){
     preferences.remove('user');
     preferences.remove('isRemember');
     return 1;
    }else{

      return 2;
    }
    print(object);
  }

  Future<bool?> createPost({String? title,String? desc}) async{
    createPostLoading(true);

    Map<String,dynamic> param = {
      "title": title,
      "body":desc,
      "userId":"1",
    };
    final response = await apiServices.post(APIConstant.postCreateAPI, param);
     if(response.length > 0){
        for(int i =0;i<response.length;i++){
          arrPost.add(PostResponse.fromJson(response[i]));
        }
        createPostLoading(false);
        return true;
      }else{
       createPostLoading(false);
        return false;
      }


    // PostResponse responseJson = PostResponse.fromJson(response);
    // print(responseJson);
    // arrPost = responseJson.;

    loading(false);
  }


}