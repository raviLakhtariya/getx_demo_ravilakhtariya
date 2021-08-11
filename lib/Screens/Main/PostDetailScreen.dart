import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:testapp/Controller/PostDetailController.dart';
import 'package:testapp/Screens/Component/LoadingWidget.dart';

class PostDetailScreen extends StatefulWidget{
  PostDetailScreenState createState() => new PostDetailScreenState();
}
class PostDetailScreenState extends State<PostDetailScreen>{
  PostDetailController controller = Get.put(PostDetailController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:Text("${controller.argumentData.last}"),actions: [IconButton(onPressed: (){
          Share.share(controller.postDetail!.title ?? "", subject:controller.postDetail!.body ?? "");
        }, icon: Icon(Icons.share))],),
        body: Obx(() =>controller.loading == true ? LoadingWidget() : Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width:size.width ,height: size.height * 0.2,
                  color: Colors.grey.withOpacity(0.5),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white38,
                      maxRadius: 50,
                      child: Text(controller.argumentData.first.toString(),style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),),
                    ),
                  ),),
                SizedBox(height: size.height * 0.05,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Text(controller.postDetail!.title ?? "", style: TextStyle(fontSize: 20),),
                ),
                SizedBox(height: size.height * 0.01,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(controller.postDetail!.body ?? "", style: TextStyle(fontSize: 17,color: Colors.black54),),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}