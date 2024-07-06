import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/home_data.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends searchMixController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, int categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  int? id;
  String? lang;
  @override
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString('lang');
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getInt("id");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialData();
    search = TextEditingController();
    getData();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("/productdetails", arguments: {
      'itemsmodel': itemsModel,
    });
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }
}

class searchMixController extends GetxController {
  TextEditingController? search;
  List<ItemsModel> listData = [];
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("/productdetails", arguments: {
      'itemsmodel': itemsModel,
    });
  }

  bool isSearch = false;
  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listData.clear();
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
