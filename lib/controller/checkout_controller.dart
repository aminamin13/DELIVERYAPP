import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:ecommerceapp/data/datasource/remote/checkout_data.dart';
import 'package:ecommerceapp/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  String? paymentMethod;
  String? deliveryType;
  String addressId = "0";

  late String couponId;
  late String priceOrder;
  late String couponDiscount;

  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  List<AddressModel> data = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  choosePaymentMethod(String val) {
    paymentMethod = val;

    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;

    update();
  }

  chooseShippingAddress(String val) {
    addressId = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please choose payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please choose delivery type");
    }

    statusRequest = StatusRequest.loading;

    Map data = {
      "usersid": myServices.sharedPreferences.getInt("id").toString(),
      "addressid": addressId.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceOrder,
      "couponid": couponId,
      "coupondiscount": couponDiscount,
      "paymentmethod": paymentMethod.toString(),
    };

    var response = await checkoutData.checkout(data);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("Success");
        Get.offAllNamed(AppRoute.homescreen);
        Get.snackbar("Success", "The order has been created successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "Please Try Again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponId'];
    priceOrder = Get.arguments['priceOrder'];
    couponDiscount= Get.arguments['discountCoupon'];
    super.onInit();
    getShippingAddress();
  }
}
