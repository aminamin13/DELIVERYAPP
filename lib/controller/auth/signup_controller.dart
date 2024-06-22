import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate1 = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;

  late FocusNode usernameFocusNode;
  @override
  goToSignIn() {
    Get.offNamed(AppRoute.SignIn);
  }

  @override
  signUp() {
    var formdata = formstate1.currentState;
    if (formdata!.validate()) {
      Get.offAllNamed(AppRoute.verifycodeSignup);
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    usernameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    usernameFocusNode.dispose();
  }
}
