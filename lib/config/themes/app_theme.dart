import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:move_mate/config/themes/ap_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle:
            TextStyle(color: Color(0xff383838), fontWeight: FontWeight.w500),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: primaryColor,
              width: 0.4,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.white,
              width: 0.4,
            )),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))));
}
