import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();

  // key --> id items
  //value --> 1 or 0
  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getInt("id")!.toString(), itemsid);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        Get.rawSnackbar(
            title: "Success",
            duration: const Duration(seconds: 1),
            messageText: const Text("Added To Favorite"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getInt("id")!.toString(), itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        Get.rawSnackbar(
            title: "Success",
            duration: const Duration(seconds: 1),
            messageText: const Text("Removed from Favorite"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }




  
}
