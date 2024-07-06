import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class CartData {
  Crud crud;

  CartData(this.crud);


  removeCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartRemove,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
   addCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartAdd,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
   countItemsCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.countCartItems,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
     viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartView,
        {"usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
