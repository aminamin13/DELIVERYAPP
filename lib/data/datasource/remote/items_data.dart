import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getData(String id, String userid) async {
    var response = await crud.postData(
        AppLink.items, {"id": id.toString(), "usersid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
