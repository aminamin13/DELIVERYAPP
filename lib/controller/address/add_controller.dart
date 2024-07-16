import 'dart:async';

import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  Completer<GoogleMapController>? completercontroller;
  Position? position;
  StatusRequest statusRequest = StatusRequest.loading;
  CameraPosition? kGooglePlex;

  List<Marker> markers = [];
  double? lat;
  double? long;

  addMarkers(LatLng latLng) {
    markers.clear;
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;

    update();
  }

  goToPageAddAddress2() {
    Get.toNamed(AppRoute.addressadd2,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }
   Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }
 

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentPosition();
    completercontroller = Completer<GoogleMapController>();
  }
}
