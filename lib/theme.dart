import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool dTheme = false;
ThemeData lightTheme = ThemeData(
  fontFamily: 'qalam',
  primaryColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0Xff9E6F21),
    elevation: 20,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 33,
      fontWeight: FontWeight.bold,
     fontFamily: 'qalam',
    ),
    iconTheme: IconThemeData(size: 30, color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  scaffoldBackgroundColor: const Color(0XffEEEEEE),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Color(0Xff245953),
      fontWeight: FontWeight.bold,
      fontSize: 21,
    ),
    bodyText2: TextStyle(
      fontSize: 22,
      color: Colors.black,
    ),
  ),
  dividerColor: Colors.black,
);
ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0Xff0f0f0f),
  fontFamily: 'qalam',
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 20,
    titleTextStyle: TextStyle(
        fontFamily: 'qalam',
        color: Color(0Xff9E6F21),
        fontSize: 33,
        fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(
      size: 30,
      color: Color(0Xff9E6F21),
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  scaffoldBackgroundColor: const Color(0Xff434343),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 21,
    ),
    bodyText2: TextStyle(
      fontSize: 22,
      color: Colors.white,
    ),
  ),
  dividerColor: Colors.white,
);
