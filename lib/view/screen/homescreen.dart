import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/view/widget/home/customnavigationappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreeControllerImp());
    return GetBuilder<HomeScreeControllerImp>(builder: (controller) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              shape: const CircleBorder(),
              onPressed: () {},
              child: const Icon(
                Icons.shopping_basket_outlined,
                color: Colors.white,
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const CustomBottomNavigationBar(),
          body: controller.listPage.elementAt(controller.currentPage));
    });
  }
}
