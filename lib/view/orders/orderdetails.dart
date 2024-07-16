import 'package:ecommerceapp/controller/orders/details_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Order Details"),
        ),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: ListView(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Table(
                    children: const [
                      TableRow(children: [
                        Text(
                          "Item Name",
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "QTY",
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Price",
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                      TableRow(
                        children: [
                          Text(
                            "MacBook",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "2",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "25",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            "MacBook",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "2",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "25",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Card(
                  child: Text(
                    "Price: 50 \$",
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Card(
                  child: Container(
                      child: const ListTile(
                title: Text("Shipping Address"),
                subtitle: Text("Cairo, Egypt"),
              ))),
              Card(
                child: Container(
                  height: 300,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    markers: controller.markers.toSet(),
                    initialCameraPosition: controller.cameraPosition!,
                    onMapCreated: (GoogleMapController GMcontroller) {
                      controller.completercontroller!.complete(GMcontroller);
                    },
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
