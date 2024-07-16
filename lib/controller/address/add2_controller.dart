import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress2Controller extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  String? lat;
  String? long;

  initailData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(lat);
    print(long);
  }

  addDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPreferences.getInt("id").toString(),
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homescreen);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initailData();
    super.onInit();
  }
}
