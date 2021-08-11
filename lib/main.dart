import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/Routers/AppRoutes.dart';
import 'package:testapp/Routers/app_pages.dart';
import 'package:testapp/Themes/AppTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test App',
      initialRoute: AppRoutes.Splash,
      getPages: AppPages.list,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}

