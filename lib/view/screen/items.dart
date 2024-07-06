import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/view/screen/home.dart';
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
    FavoriteController controllerFav = Get.put(FavoriteController());
    ItemsControllerImp controller = Get.put(ItemsControllerImp());

    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          CustomAppBar(
            titleappbar: "Find Product",
            onChanged: (value) {
              controller.checkSearch(value);
            },
            myController: controller.search!,
            onPressedSearch: () {
              controller.onSearchItems();
            },
            onPressedIconFavorite: () {
              Get.toNamed(AppRoute.myfavorite);
            },
          ),
          const CustomCategorisItems(),
          GetBuilder<ItemsControllerImp>(builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: controller.isSearch == false
                  ? GridView.builder(
                      itemCount: controller.data.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.8),
                      itemBuilder: (context, index) {
                        controllerFav.isFavorite[controller.data[index]
                            ['items_id']] = controller.data[index]['favorite'];

                        return CustomListItems(
                          itemsModel:
                              ItemsModel.fromJson(controller.data[index]),
                        );
                      })
                  : ListItemsSearch(listdataModel: controller.listData),
            );
          })
        ],
      ),
    ));
  }
}
