
import 'package:get/get.dart';
import 'package:testapp/Routers/AppRoutes.dart';
import 'package:testapp/Screens/Main/HomeScreen.dart';
import 'package:testapp/Screens/Main/PostDetailScreen.dart';
import 'package:testapp/Screens/Registration/LoginScreen.dart';
import 'package:testapp/Screens/Splash/SplashScreen.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.Splash,
        page: () => SplashScreen()),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.PostDetail,
      page: () => PostDetailScreen(),
    ),

  ];
}