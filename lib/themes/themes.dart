import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Themes {
  final lightTheme = ThemeData.light().copyWith(
    ///-------------------------elevated button theme------------------------->
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.maxFinite, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(

        filled: true,
        fillColor: Color(0xFFe8f6ef),
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:BorderSide.none,

        )
    ),

    ///-----------------app bar theme------------------>
    appBarTheme:  AppBarTheme(
        toolbarHeight: 66.h,
        color: Colors.green,
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.green
    ),
  );





  final darkTheme = ThemeData.dark().copyWith(

    ///-------------------------elevated button theme------------------------->
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.maxFinite, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),

      ///-----------------app bar theme------------------>
      appBarTheme: const AppBarTheme(
          centerTitle: false,
          color: Colors.black54,
          elevation: 0,
          shadowColor: Colors.white10)
  );
}