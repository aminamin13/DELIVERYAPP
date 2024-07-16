import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class PendingordersData {
  Crud crud;

  PendingordersData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.pendingOrders, {
      "usersid": usersid
    });
    return response.fold((l) => l, (r) => r);
  }
}
