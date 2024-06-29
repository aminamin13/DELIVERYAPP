import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {

    // if users is already logged in, it will take him to home page
      if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.homescreen);
    }
    if (myServices.sharedPreferences.getString("step") == "1" ) {
      return const RouteSettings(name: AppRoute.SignIn);
    }
   
    ;
  }
}
