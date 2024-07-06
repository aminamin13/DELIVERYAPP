import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class VerifyCodeSignUpData {
  Crud crud;

  VerifyCodeSignUpData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(
        AppLink.verifycodesignup, {"email": email, "verifycode": verifycode});
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resendCode, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
