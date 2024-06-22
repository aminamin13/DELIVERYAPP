import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkcode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifycode;
  @override
  checkcode() {
    // TODO: implement checkcode
    throw UnimplementedError();
  }

  @override
  goToResetPassword() {
    // TODO: implement goToResetPassword
    Get.offAllNamed(AppRoute.resetpassword);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
