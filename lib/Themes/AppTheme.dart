
import 'package:flutter/material.dart';


class AppTheme{
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: colorWhite,
    appBarTheme: AppBarTheme(
        color: Colors.pink,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: colorWhite,
        ),
        titleTextStyle: TextStyle(color: colorDarkPurple,fontSize: 20.0)
    ),
    cardTheme: CardTheme(
        color: colorWhite
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: colorWhite,
    appBarTheme: AppBarTheme(
        color: colorBlack,
        iconTheme: IconThemeData(
          color: colorBlack,
        ),
        titleTextStyle: TextStyle(color: colorWhite,fontSize: 20.0)
    ),
    cardTheme: CardTheme(
        color: colorWhite
    ),
  );

}

const colorf0White = Color(0xFFf0f0f0);
const colorOrange = Color(0xFFff938d);
const colorGreen = Color(0xFF00bebc);
const colorWhite = Color(0xFFFFFFFF);
const colorDarkPurple = Color(0xFF624692);
const colorlightPurple = Color(0xFF6964a0);
const colorDarkGreen = Color(0xFF6c7b73);
const colorBlue = Color(0xFF366ec3);

const colorShadowLightPurple = Color(0xac6964a0);
const colordashboardMenu = Color(0x0f6964a0);

const colorRed = Color(0xFFbb2200);
const colorDartGreen = Color(0xFF4f801e);
const colorcustomGray = Color(0xFF49505e);

//color constants
const colorPrimary = Color(0xFF394469);
const colorSecondary = Color(0xFFeff6fb);
const colorLightGrey = Color(0xFFCCCCCC);

const colorBlack = Color(0xFF000000);

const colorlightBlues = Color(0xFF9dbcd3);
const colorlightBlue = Color(0xFF8ab9eb);