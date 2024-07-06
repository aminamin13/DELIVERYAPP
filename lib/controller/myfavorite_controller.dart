import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommerceapp/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyfavoriteController extends GetxController {
  List<MyFavoriteModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData
        .viewFavorite(myServices.sharedPreferences.getInt("id").toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteData(String favoriteid) {
    var response = myFavoriteData.deleteFavorite(favoriteid.toString());

    data.removeWhere((element) => element.favoriteId.toString() == favoriteid);
    Get.rawSnackbar(
        title: "Success",
        duration: const Duration(seconds: 1),
        messageText: const Text("Removed from Favorite"));

    // End

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
