import 'package:ecommerceapp/core/constant/apptheme.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? langauge;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPerfLang = myServices.sharedPreferences.getString("lang");
    if (sharedPerfLang == "en") {
      langauge = const Locale("en");
      appTheme = themeEnglish;
    } else if (sharedPerfLang == "ar") {
      langauge = const Locale("ar");
      appTheme = themeArabic;
    } else {
      langauge = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }

    super.onInit();
  }
}
