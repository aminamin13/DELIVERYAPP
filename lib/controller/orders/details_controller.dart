import 'dart:async';

import 'package:ecommerceapp/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;

  List<Marker> markers = [];
  double? lat;
  double? long;
  Completer<GoogleMapController>? completercontroller;
  CameraPosition? cameraPosition;

  initialData() {
    cameraPosition = const CameraPosition(
      target: LatLng(35.22, 37.3),
      zoom: 14.4746,
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialData();
    ordersModel = Get.arguments['ordersModel'];
        completercontroller = Completer<GoogleMapController>();

  }
}
