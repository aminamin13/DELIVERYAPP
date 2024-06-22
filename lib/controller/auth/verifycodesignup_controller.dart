import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkcode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  late String verifycodeSignUp;
  @override
  checkcode() {
    // TODO: implement checkcode
    throw UnimplementedError();
  }

  @override
  goToSuccessSignUp() {
    // TODO: implement goToSuccessSignUp
    Get.offAllNamed(AppRoute.successSignup);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
