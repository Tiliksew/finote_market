import 'package:flutter/material.dart';

class CustomThemeData {
  static final ThemeData darkTheme = ThemeData(
    // accentColor: Colors.red,
    fontFamily: 'LosAngeleno',
    brightness: Brightness.dark,
    primaryColor:const Color(0xff009FB7),
    buttonTheme: const  ButtonThemeData(
      buttonColor: Color(0xff009FB7),
      disabledColor: Colors.grey,
    ));

static final ThemeData lightTheme = ThemeData(
    // accentColor: Colors.pink,
    brightness: Brightness.light,
    fontFamily: 'LosAngeleno',
    primaryColor: const Color(0xff009FB7),
    buttonTheme: const ButtonThemeData(
      buttonColor:  Color(0xff009FB7),
      disabledColor: Color(0xffEFF1F3),
    ));
}

// #7E52A0 #29274C #012A36 #D295BF #E6BCCD

// #1098F7 #000000 #FFFFFF #B89E97 #DECCCC

// main
// #152614 #1E441E #2A7221 #119822 #31CB00   #159F1E

// FF4E00 8EA604 F5BB00 EC9F05 BF3100

// 009FB7 272727 FED766 696773 EFF1F3