import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/signupdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate1 = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;

  late FocusNode usernameFocusNode;

  StatusRequest statusRequest = StatusRequest.none;

  SignUpData signUpData = SignUpData(Get.find());

  List data = [];

  bool isShowPassword = true;

  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.SignIn);
  }

  @override
  signUp() async {
    var formdata = formstate1.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;

      update();
      var response = await signUpData.postData(
          username.text, password.text, email.text, phone.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.verifycodeSignup, arguments: {"email" : email.text});
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "This Email or Phone Is Already Exist");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
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
