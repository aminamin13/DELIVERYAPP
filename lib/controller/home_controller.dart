import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdatacontroller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, int  categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  int? id;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  StatusRequest statusRequest = StatusRequest.none;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getInt("id");

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialData();
    getData();
  }

  @override
    goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items,
        arguments: {"categories": categories, "selectedcat": selectedCat, "catid": categoryid});
  }
  
}
