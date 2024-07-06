import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/linkapi.dart';
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
      return Container(
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
              HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: controller.isSearch == false
                      ? const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              CustomCardHome(
                                  title: "A Summer Surprise",
                                  body: "CashBack 20%"),
                              CustomTitleHome(title: "Categories"),
                              CustomCategorisHome(),
                              CustomTitleHome(title: "Best Selling"),
                              CustomItemHome(),
                              CustomTitleHome(title: "New Items"),
                              CustomItemHome()
                            ])
                      : ListItemsSearch(
                          listdataModel: controller.listData,
                        )),
            ],
          ));
    });
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  ListItemsSearch({super.key, required this.listdataModel});
  List<ItemsModel> listdataModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listdataModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdataModel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl:
                          '${AppLink.imageitems}/${listdataModel[index].itemsImage}',
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: ListTile(
                          subtitle: Text(listdataModel[index].categoriesName!),
                          title: Text(listdataModel[index].itemsName!))),
                ]),
              )),
            ),
          );
        });
  }
}
