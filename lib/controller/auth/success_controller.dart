import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

abstract class SuccessController extends GetxController {
  goToSignIn();
}

class SuccessControllerImp extends SuccessController {
  @override
  goToSignIn() {
    Get.offAllNamed(AppRoute.SignIn);
  }
}