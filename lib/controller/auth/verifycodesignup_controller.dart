import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkcode();
  goToSuccessSignUp(String verifyodesignup);
  resend();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  late String verifycodeSignUp;
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkcode() {
    // TODO: implement checkcode
    throw UnimplementedError();
  }

  @override
  goToSuccessSignUp(String verifyodesignup) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(email!, verifyodesignup);
    print("======================== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.successSignup);
      } else {
        Get.defaultDialog(
            title: "ُWarning",
            middleText: "Verify Code is Not Correct",
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

  resend() {
         verifyCodeSignUpData.resendData(email!);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email = Get.arguments['email'];
  }
}
