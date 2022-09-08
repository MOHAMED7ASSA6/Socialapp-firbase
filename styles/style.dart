

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData ?lighttheme=ThemeData(
scaffoldBackgroundColor: Colors.white,
appBarTheme: AppBarTheme(
iconTheme: IconThemeData(
color: Colors.black,
),
backwardsCompatibility: false,
systemOverlayStyle: SystemUiOverlayStyle(
statusBarColor: Colors.white,
statusBarIconBrightness: Brightness.dark,
),
backgroundColor: Colors.white,
elevation: 0.0,
titleTextStyle: TextStyle(
color: Colors.black,
fontWeight: FontWeight.bold,
fontSize: 22.0,
),
),
bottomNavigationBarTheme: BottomNavigationBarThemeData(
type: BottomNavigationBarType.fixed,
selectedItemColor: Colors.deepOrange,
elevation: 20.0,
),
textTheme: TextTheme(
bodyText1: TextStyle(
fontSize: 18.0,
fontWeight: FontWeight.w600,
color: Colors.black,
),
    caption: TextStyle(
      fontFamily: 'jannah',
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle1:TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    )
),
fontFamily: 'jannah',
);
ThemeData ?darttheme=ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(

    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: 'jannah',
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 22.0,
    ),

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'jannah',
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
      caption: TextStyle(
        fontFamily: 'jannah',
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      subtitle1:TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      )
  ),
  fontFamily: 'jannah',
);