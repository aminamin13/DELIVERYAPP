import 'package:ecommerceapp/controller/test_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TextController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
        ),
        body: GetBuilder<TextController>(builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return Text('${controller.data}');
                  }));
        }));
  }
}
