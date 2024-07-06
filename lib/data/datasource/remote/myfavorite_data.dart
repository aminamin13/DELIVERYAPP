import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class MyFavoriteData {
  Crud crud;

  MyFavoriteData(this.crud);

  viewFavorite(String id) async {
    var response =
        await crud.postData(AppLink.favoriteView, {"usersid": id.toString()});
    return response.fold((l) => l, (r) => r);
  }

    deleteFavorite(String favoriteid) async {
    var response =
        await crud.postData(AppLink.removemyfavorite, {"favoriteid": favoriteid});
    return response.fold((l) => l, (r) => r);
  }
}
