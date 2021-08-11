import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/Models/PostDetailResponseModel.dart';
import 'package:testapp/Models/PostResponseModel.dart';
import 'package:testapp/Services/APIConstant.dart';
import 'package:testapp/Services/APIServices.dart';

class PostDetailController extends GetxController{
  PostDetailResponseModel? postDetail;
  var loading = false.obs;
  var error = "";
  APIServices apiServices = new APIServices();
  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    print(argumentData);
    // TODO: implement onInit
    super.onInit();
    fetchPost();
  }
  void fetchPost() async{
    loading(true);
    final response = await apiServices.get(APIConstant.postAPI+"/${argumentData.first}");
    PostDetailResponse responseJson = PostDetailResponse.fromJson(response);
    postDetail = new PostDetailResponseModel(title: responseJson.title,id: responseJson.id,body: responseJson.body,userId: responseJson.userId);
loading(false);
  }
}

class PostDetailResponseModel {
  PostDetailResponseModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId, id;
  String? title, body;
}