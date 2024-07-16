import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:ecommerceapp/data/model/addressmodel.dart';
import 'package:get/get.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  List<AddressModel> data = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    update();

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

  deleteAddress(String addressId) {
    addressData.deleteData(addressId);
    data.removeWhere((e) => e.addressId == int.parse(addressId));
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
