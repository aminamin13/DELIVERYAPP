import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/cart_data.dart';
import 'package:ecommerceapp/data/model/cartmodel.dart';
import 'package:ecommerceapp/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> data = [];
  CouponModel? couponModel;
  double priceorders = 0.0;
  int totalcountitems = 0;

  int? discountCoupon = 0;
  String? couponName;
  int? couponId;

  TextEditingController? controllerCoupon;

  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

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

  viewItems() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData
        .viewCart(myServices.sharedPreferences.getInt("id")!.toString());
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalcount']);
          priceorders = dataresponsecountprice['totalprice'].toDouble();

          print(priceorders);
          print(totalcountitems);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    viewItems();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    viewItems();
    controllerCoupon = TextEditingController();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllerCoupon!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountCoupon = couponModel!.couponDiscount;
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId!;
        Get.rawSnackbar(
          title: "Success",
          messageText: const Text("Coupon applied successfully"),
          duration: const Duration(seconds: 1),
        );
      } else {
        discountCoupon = 0;

        couponName = null;
        couponId = null;
        Get.rawSnackbar(
          title: "Error",
          messageText: const Text("Coupon not valid"),
          duration: const Duration(seconds: 1),
        );
      }
    }
    update();
  }

  getTotalPrice() {
    return (priceorders - priceorders * discountCoupon! / 100);
  }

  goToPageCheckout() {
    if (data.isEmpty) {
      return Get.snackbar("Warning", "Cart is empty");
    }

    Get.toNamed(AppRoute.checkout, arguments: {
      "couponId": couponId.toString() ?? "0",
      "priceOrder": priceorders.toString(),
      "discountCoupon": discountCoupon.toString()
    });
  }
}
