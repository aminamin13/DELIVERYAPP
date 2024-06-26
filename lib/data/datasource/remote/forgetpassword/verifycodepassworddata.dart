import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class VerifyCodePasswordData {
  Crud crud;

  VerifyCodePasswordData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(
        AppLink.verifyCodePassword, {"email": email, "verifycode": verifyCode});
    return response.fold((l) => l, (r) => r);
  }
}
