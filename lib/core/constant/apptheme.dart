import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily: "PlayfairDisplay",
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[50],
        titleTextStyle: const TextStyle(
            color: AppColor.primaryColor,
            fontSize: 20,
            fontFamily: "PlayfairDisplay",
            fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0),
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
    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        backgroundColor: Colors.grey[50],
        titleTextStyle: const TextStyle(
            color: AppColor.primaryColor,
            fontSize: 20,
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0),
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
