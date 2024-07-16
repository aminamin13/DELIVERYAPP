import 'package:ecommerceapp/controller/orders/pending_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/data/model/ordersmodel.dart';
import 'package:ecommerceapp/view/widget/orders/cardorderlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    PendingOrderController controller = Get.put(PendingOrderController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Orders"),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<PendingOrderController>(builder: (controller) {
              return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return CardOrderList(ordersModel: controller.data[index]);
                    },
                  ));
            })));
  }
}
