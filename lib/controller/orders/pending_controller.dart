import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/orders/pendingorders_data.dart';
import 'package:ecommerceapp/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class PendingOrderController extends GetxController {
  List<OrdersModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  PendingordersData pendingordersData = PendingordersData(Get.find());
  MyServices myServices = Get.find();

  printTypeOrder(String val){
    if(val == "0"){
      return "Delivery";
    }else if(val == "1"){
      return "Drive Thru";
    }
  }
  printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash on delivery";
    } else if (val == "1") {
      return "Credit Card";
    }
  }

  printOrderStatus(String val){
if (val == "0") {
      return "Awaiting Approval";
    } else if (val == "1") {
      return "Preparing Order";
    } else if (val == "2") {
      return "Order on the way";
    } else if (val == "3") {
      return "Order Delivered";
    }else{
      return "Archived";
    }
  }
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingordersData
        .getData(myServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder(){
    getData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
