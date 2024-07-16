import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class CheckoutData {
  Crud crud;

  CheckoutData(this.crud);

  checkout(Map data) async {
    var response = await crud.postData(AppLink.orderCheckout, data);
    return response.fold((l) => l, (r) => r);
  }
}
