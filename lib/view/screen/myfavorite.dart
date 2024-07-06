import 'package:ecommerceapp/controller/myfavorite_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/view/widget/customappbar.dart';
import 'package:ecommerceapp/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    MyfavoriteController controller = Get.put(MyfavoriteController());
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GetBuilder<MyfavoriteController>(builder: (controller) {
        return ListView(children: [
          // CustomAppBar(
          //     titleappbar: "Find Product",
          //     onPressedSearch: () {},
          //     onPressedIconFavorite: () {
          //       Get.toNamed(AppRoute.myfavorite);
          //     }),
          HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  return CustomListFavoriteItems(
                      myFavoriteModel: controller.data[index]);
                },
              ))
        ]);
      }),
    ));
  }
}
