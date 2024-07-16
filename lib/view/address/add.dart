import 'package:ecommerceapp/controller/address/add_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controller = Get.put(AddAddressController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Address"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            controller.getUserCurrentLocation().then((value) async {
              print("${value.latitude} ${value.longitude}");
              controller.addMarkers(LatLng(value.latitude, value.longitude));
            });
          },
          child: const Icon(Icons.my_location),
        ),
        body: Container(
          child: GetBuilder<AddAddressController>(builder: (controllerpage) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  if (controllerpage.kGooglePlex != null)
                    Expanded(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            markers: controllerpage.markers.toSet(),
                            onTap: (latlong) {
                              controllerpage.addMarkers(latlong);
                            },
                            initialCameraPosition: controllerpage.kGooglePlex!,
                            onMapCreated: (GoogleMapController GMcontroller) {
                              controllerpage.completercontroller!
                                  .complete(GMcontroller);
                            },
                          ),
                          Container(
                              child: MaterialButton(
                            onPressed: () {
                              controllerpage.goToPageAddAddress2();
                            },
                            minWidth: 200,
                            color: AppColor.primaryColor,
                            child: const Text("Add Details",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ))
                        ],
                      ),
                    ),
                ],
              ),
            );
          }),
        ));
  }
}
