import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class SignInData {
  Crud crud;

  SignInData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.signIn, {
      "password": password,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
