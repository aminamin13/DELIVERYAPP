import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
  gotToSignIn();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
    GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  resetpassword() {}

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoute.successresetpassword);
  }

  @override
  gotToSignIn() {
    Get.offNamed(AppRoute.SignIn);
  }

  @override
  void onInit() {
    super.onInit();
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
