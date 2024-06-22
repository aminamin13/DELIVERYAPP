import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
    GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  checkemail() {}

  @override
  goToVerifyCode() {
    // TODO: implement goToVerifyCode
    Get.offAllNamed(AppRoute.verifyCode);
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
  }
}
