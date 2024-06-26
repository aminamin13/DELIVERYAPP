import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/data/datasource/remote/forgetpassword/resetpassworddata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  gotToSignIn();
  showPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPassword = true;

  StatusRequest statusRequest = StatusRequest.none;
  String? email;

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  resetpassword() async {
    if (password.text != repassword.text) {
      Get.defaultDialog(
          title: "ُWarning",
          middleText: "Passwords do not match",
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Ok"))
          ]);
    } else {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetPasswordData.postData(email!, password.text);
        print("======================== $response");
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            Get.offAllNamed(AppRoute.successresetpassword);
          } else {
            Get.defaultDialog(
                title: "ُWarning",
                middleText: "You cant enter the old password",
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Ok"))
                ]);
            statusRequest = StatusRequest.failure;
          }
        }
        update();
      }
    }
  }

  @override
  @override
  gotToSignIn() {
    Get.offNamed(AppRoute.SignIn);
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    password.dispose();
    repassword.dispose();
  }
}
