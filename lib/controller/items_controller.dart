import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/items_data.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController  {
  intialData();
  changeCat(int val, String catval);
  getItem(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends searchMixController {
  List categories = [];
  int? selectedCat;
  String? catid;
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'].toString();
    getItem(catid!);
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;

    getItem(catval);

    update();
  }

  @override
  getItem(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(categoryid, myServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    intialData();
    search = TextEditingController();
  }
  
  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("/productdetails", arguments:{
      'itemsmodel': itemsModel,
    } );
  }
}
