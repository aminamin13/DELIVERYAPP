import 'package:ecommerceapp/core/constant/apptheme.dart';
import 'package:ecommerceapp/core/functions/firebasecloudmessaging.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

  requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Get.snackbar("Error", "Location services are disabled.");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Get.snackbar(
          "Error",
          "Location services are disabled.",
        );
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmConfig();
    requestPermissionLocation();
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
