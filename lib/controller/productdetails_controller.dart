import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/cart_data.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;

  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  int countItems = 0;

  List subitems = [
    {"name": "red", "id": 1, "active": '1'},
    {"name": "blue", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '0'},
  ];
  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countItems = await getCountItems(itemsModel.itemsId!.toString());

    statusRequest = StatusRequest.success;

    update();
  }

  add() {
    addCart(itemsModel.itemsId!.toString());
    countItems++;
    update();
  }

  remove() {
    if (countItems > 0) {
      removeCart(itemsModel.itemsId!.toString());

      countItems--;
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    intialData();
  }

  addCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.addCart(
        myServices.sharedPreferences.getInt("id")!.toString(), itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Success", messageText: const Text("item add to cart"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  removeCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getInt("id")!.toString(), itemsid);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        Get.rawSnackbar(
            title: "Success",
            duration: const Duration(seconds: 1),
            messageText: const Text("item removed from cart"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;

    var response = await cartData.countItemsCart(
        myServices.sharedPreferences.getInt("id")!.toString(), itemsid);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        int countItems = 0;

        countItems = response['data'];
        print("=============================== Controller $countItems ");
        return countItems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
