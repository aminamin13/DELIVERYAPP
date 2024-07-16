import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class NotificationData {
  Crud crud;

  NotificationData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.viewNotification, {
      "usersid": usersid
    });
    return response.fold((l) => l, (r) => r);
  }
}
