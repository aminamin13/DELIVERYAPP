import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/view/widget/customappbar.dart';
import 'package:ecommerceapp/view/widget/items/customecategorisitems.dart';
import 'package:ecommerceapp/view/widget/items/customlistitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());

    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GetBuilder<ItemsControllerImp>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                CustomAppBar(
                    titleappbar: "Find Product",
                    onPressedIcon: () {},
                    onPressedSearch: () {}),
                const CustomCategorisItems(),
                GridView.builder(
                    itemCount: controller.data.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.8),
                    itemBuilder: (context, index) {
                      return CustomListItems(
                        itemsModel: ItemsModel.fromJson(controller.data[index]),
                      );
                    }),
              ],
            ));
      }),
    ));
  }
}
