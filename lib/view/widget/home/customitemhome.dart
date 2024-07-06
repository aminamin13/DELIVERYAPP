import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemHome extends GetView<HomeControllerImp> {
  const CustomItemHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.only(top: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.items[index]),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.items.length),
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    super.key,
    required this.itemsModel,
  });
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Image.network(
          "${AppLink.imageitems}/${itemsModel.itemsImage}",
          height: 100,
          width: 150,
          fit: BoxFit.fill,
        ),
      ),
      Container(
        height: 120,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.black.withOpacity(0.2)),
      ),
      Positioned(
        left: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Text(
            "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    ]);
  }
}
