import 'package:ecommerceapp/controller/orders/pending_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrderList extends GetView<PendingOrderController> {
  const CardOrderList({
    super.key,
    required this.ordersModel,
  });

  final OrdersModel ordersModel;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order Number : #${ordersModel.ordersId}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      Jiffy.parse(ordersModel.ordersDatetime!).fromNow(),
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                Text(
                    "Order Type : ${controller.printTypeOrder(ordersModel.ordersType.toString())}"),
                Text("Order Type : ${ordersModel.ordersPrice} \$"),
                Text("Delivery Price: ${ordersModel.ordersPricedelivery} \$"),
                Text(
                    "Payment Method : ${controller.printPaymentMethod(ordersModel.ordersPaymentmethod.toString())}"),
                Text(
                    "Order Status : ${controller.printOrderStatus(ordersModel.ordersStatus.toString())}"),
                const Divider(),
                Row(
                  children: [
                    Text("Total Price : ${ordersModel.ordersTotalprice} \$",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor)),
                    const Spacer(),
                    MaterialButton(
                        onPressed: () {
                          Get.toNamed(AppRoute.ordersdetails, arguments:{
                            "ordersModel": ordersModel
                          });
                        },
                        color: AppColor.thirdColor,
                        textColor: AppColor.secondarycolor,
                        child: const Text("View Details"))
                  ],
                ),
              ],
            )));
  }
}
