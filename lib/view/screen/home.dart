import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/view/widget/customappbar.dart';
import 'package:ecommerceapp/view/widget/home/customcardhome.dart';
import 'package:ecommerceapp/view/widget/home/customcategorishome.dart';
import 'package:ecommerceapp/view/widget/home/customitemhome.dart';
import 'package:ecommerceapp/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  CustomAppBar(
                    titleappbar: "Find Product",
                    onPressedIcon: () {},
                    onPressedSearch: () {},
                  ),
                  const CustomCardHome(
                      title: "A Summer Surprise", body: "CashBack 20%"),
                  const CustomTitleHome(title: "Categories"),
                  const CustomCategorisHome(),
                  const CustomTitleHome(title: "Best Selling"),
                  const CustomItemHome(),
                  const CustomTitleHome(title: "New Items"),
                  const CustomItemHome()
                ],
              )));
    });
  }
}
