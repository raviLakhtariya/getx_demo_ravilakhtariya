import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/Controller/HomeController.dart';
import 'package:testapp/Helper/Utils.dart';
import 'package:testapp/Routers/AppRoutes.dart';

import 'package:testapp/Screens/Component/LoadingWidget.dart';

class HomeScreen extends StatefulWidget{
  HomeScreenState createState() => new HomeScreenState();
}
class HomeScreenState extends State<HomeScreen>{

  HomeController controller = Get.put(HomeController());
  TextEditingController titletextEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();

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
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Posts"),
            /*actions: [IconButton(onPressed: () async{
              await controller.clickLogout().then((success){
                if(success == 1){
                  Get.offNamed(AppRoutes.Login,arguments: [false]);
                }else{
                  Get.offNamed(AppRoutes.Login,arguments: [true]);
                }
              });
            }, icon: Icon(Icons.power_settings_new_rounded))]*/
          ),
          body: Obx(()=> Container(
            child:  controller.loading == true ?
              LoadingWidget() :
              ListView.builder(
              itemCount:controller.arrPost.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.PostDetail,arguments: [controller.arrPost[index]!.id,controller.arrPost[index]!.title]);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                      color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black26,offset: Offset(2,2),blurRadius: 2.0)],
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text((controller.arrPost[index]!.title)!,style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                            Text((controller.arrPost[index]!.body)!,style: TextStyle(fontSize: 14),),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
          )
/*GetBuilder<HomeController>(
                builder: (controller){
                  return controller.loading == true ?
                  LoadingWidget() :
                  ListView.builder(
                      itemCount:controller.arrPost.length,
                      itemBuilder: (context,index){
                        return Container(
                          child: IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text((controller.arrPost[index]!.title)!,style: TextStyle(fontSize: 21),),
                                Text((controller.arrPost[index]!.body)!,style: TextStyle(fontSize: 14),),
                              ],
                            ),
                          ),
                        );
                      }
                  );

                }*/
          //  ),
          ),),
            floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            backgroundColor:  Colors.pink,
            child: new Icon(Icons.add),
            onPressed: (){
              openDialog();
            }
        )
    )
    );
 }


  Widget? openDialog()
  {
    Get.defaultDialog(
        title: 'New post',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 35,
              child: TextField(
                controller: titletextEditingController,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: 'Enter title',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 35,
              child: TextField(
                controller: descriptionEditingController,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: 'Enter Description',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(onPressed: (){
                  titletextEditingController.text = "";
                  descriptionEditingController.text = "";

                 }, child: Text("Clear")),
                FlatButton(

                  onPressed: () async{
                    if(titletextEditingController.text.isEmpty == true){
                      Customutils.callSnackBar("Please enter title", true);
                    }else if (descriptionEditingController.text.isEmpty == true){
                      Customutils.callSnackBar("Please enter description", true);
                    }else{
                      Get.back();
                      await controller.createPost(title: titletextEditingController.text,desc: descriptionEditingController.text).then((success){
                        if(success == true){

                          openBottomSheet();
                        }else{
                          Customutils.callSnackBar("Error", true);
                        }
                      });
                    }


                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  color: Colors.pink,
                )
              ],
            ),

          ],
        ),
        radius: 10.0);
  }


  void openBottomSheet(){
    Get.bottomSheet(
      Container(
          height: 170,
          color: Colors.white,
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Icon(Icons.check_circle_rounded,size: 100,color: Colors.pink,),
                ),
                SizedBox(height: 5,),
                Text("Successfully created")

              ],
            ),
          )
      ),
      barrierColor: Colors.red[50],
      isDismissible: true,
    );
  }

}