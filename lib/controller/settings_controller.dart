import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
                int usersid = myServices.sharedPreferences.getInt("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$usersid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.SignIn);
  }
}
