import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/notification_data.dart';
import 'package:ecommerceapp/data/model/notificationmodel.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<NotificationModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  NotificationData notificationData = NotificationData(Get.find());
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData
        .getData(myServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => NotificationModel.fromJson(e)));
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
    getData();
  }
}
