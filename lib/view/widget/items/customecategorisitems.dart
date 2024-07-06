import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategorisItems extends GetView<ItemsControllerImp> {
  const CustomCategorisItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 60,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
            );
          }),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  const Categories({
    required this.i,
    super.key,
    required this.categoriesModel,
  });
  final int? i;
  final CategoriesModel categoriesModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, categoriesModel.categoriesId!.toString());
      },
      child: GetBuilder<ItemsControllerImp>(builder: (context) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3, color: AppColor.primaryColor)))
                  : null,
              child: Text("${categoriesModel.categoriesName}",
                  style: const TextStyle(
                    fontSize: 17,
                    color: AppColor.grey2,
                  )),
            )
          ],
        );
      }),
    );
  }
}
