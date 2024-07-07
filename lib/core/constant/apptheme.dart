import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily: "PlayfairDisplay",
    appBarTheme: const AppBarTheme(backgroundColor: AppColor.primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor, foregroundColor: Colors.white),
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 30,
          color: AppColor.black,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          color: AppColor.black,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
            fontSize: 14,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            height: 2)));
ThemeData themeArabic = ThemeData(
    fontFamily: "Cairo",
    appBarTheme: const AppBarTheme(backgroundColor: AppColor.primaryColor),
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 30,
          color: AppColor.black,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          color: AppColor.black,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
            fontSize: 14,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            height: 2)));
