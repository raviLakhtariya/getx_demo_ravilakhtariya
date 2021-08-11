import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testapp/Controller/LoginController.dart';
import 'package:testapp/Routers/AppRoutes.dart';
import 'package:testapp/Screens/Component/LoadingWidget.dart';


class LoginScreen extends StatefulWidget{
  LoginScreenState createState() => new LoginScreenState();
}
class LoginScreenState extends State<LoginScreen>{
  LoginController loginController = Get.put(LoginController());
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  // Get.toNamed('/login');
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      body: Obx(() => Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "LOGIN",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21.0),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "asset/login.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    initialValue: loginController.email == "" ? "":loginController.email ,
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                          //borderSide: const BorderSide(),
                        ),
                        filled: true,
                        prefixIcon:Icon(Icons.person), labelText: "Email") ,


                    // validator: (String? value) =>
                    // Customutils.validateEmail(value ?? "")
                    //     ? null
                    //     : "Please enter a valid email",
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                      initialValue: loginController.password == "" ? "":loginController.password ,
                    controller: passwordController,
                    decoration: InputDecoration(

                        border: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                          //borderSide: const BorderSide(),
                        ),
                        filled: true,
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            loginController.passwordVisible == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            loginController.updateVisibility();
                          },
                        )),
                    obscureText: !(loginController.passwordVisible.value),
                    //  validator: (String? value) => Customutils.validatePassword(value!.trim())
                    //      ? "Password is require"
                    //      : null,
                  ),
                  SizedBox(height: 8),
                  remember(),
                  SizedBox(height: 8),
                  loginBtn()
                ],
              ),
            ),
          ),
          loginController.loginProcess == true ? LoadingWidget() : SizedBox(width: 0,height: 0,)
        ],
      )),
    ));
  }

  Widget remember(){
    return Container(
      height: 30,
      child:Align(
        alignment: Alignment.centerLeft,
        child:Obx(()=> FlatButton.icon(onPressed: (){
          loginController.updateRememberCheck();
        }, icon: Icon(
            loginController.rememberCheck == true ?
            Icons.check_box :
            Icons.check_box_outline_blank
        )
            , label: Text("Remember")
        )),
      ),
    );
  }

  Widget loginBtn(){
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
        height: 80,
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(onPressed: () async {
        var validate = loginController.checkvalidations(email: emailController.text, password: passwordController.text);
          if(validate == true){
           await loginController.login(email: emailController.text, password: passwordController.text , isRemember:loginController.rememberCheck.value).then((success){
              if(success == true){
                Get.offNamed(AppRoutes.Home);
              }
            });
          }

        //loginController.login(email: email, password: password, isRemember: isRemember)
      },child: Text("Login"),
      style: ButtonStyle(

          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.white38)
              )
          )
      ),),
    ));
  }


}