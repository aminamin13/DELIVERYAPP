import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/data/datasource/remote/forgetpassword/verifycodepassworddata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodePassController extends GetxController {
  checkcode(String verifyCode);
}

class VerifyCodePassControllerImp extends VerifyCodePassController {
  late String verifycode;

  VerifyCodePasswordData verifyCodePasswordData =
      VerifyCodePasswordData(Get.find());
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  checkcode(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodePasswordData.postData(email!, verifyCode);
    print("======================== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.resetpassword, arguments: {'email': email});
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
