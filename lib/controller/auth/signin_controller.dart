import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/signindata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController {
  signIn();
  goToSignUp();
  goToForgetPassword();
  showPassword();
}

class SignInControllerImp extends SignInController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  bool isShowPassword = true;

  StatusRequest statusRequest = StatusRequest.none;

  SignInData signInData = SignInData(Get.find());

  MyServices myServices = Get.find();

  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  signIn() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;

      update();
      var response = await signInData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == 1) {
            myServices.sharedPreferences
                .setInt("id", response['data']['users_id']);
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");
            Get.offAllNamed(AppRoute.homescreen);
          } else {
            Get.toNamed(AppRoute.verifycodeSignup,
                arguments: {'email': email.text});
          }
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "the email or password is not correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("not valid");
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;

      print(token);
    });

    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetpassword);
  }
}
