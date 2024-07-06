import 'package:ecommerceapp/controller/productdetails_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemList extends GetView<ProductDetailsControllerImp> {
  const SubItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(controller.subitems.length, (index) {
          return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 5),
              height: 60,
              width: 90,
              decoration: BoxDecoration(
                  color: controller.subitems[index]['active'] == '1'
                      ? AppColor.fourthColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.fourthColor)),
              child: Text("${controller.subitems[index]['name']}",
                  style: TextStyle(
                      color: controller.subitems[index]['active'] == '1'
                          ? Colors.white
                          : AppColor.fourthColor,
                      fontWeight: FontWeight.bold)));
        })
      ],
    );
  }
}