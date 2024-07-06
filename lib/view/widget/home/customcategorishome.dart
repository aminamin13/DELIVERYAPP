import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomCategorisHome extends GetView<HomeControllerImp> {
  const CustomCategorisHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 120,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categoris(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
            );
          }),
    );
  }
}

class Categoris extends GetView<HomeControllerImp> {
  const Categoris({
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
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.svgColor,
            ),
            child: Center(
              child: SvgPicture.network(
                "${AppLink.imagecategories}/${categoriesModel.categoriesImage}",
                color: AppColor.secondarycolor,
                height: 50,
                width: 50,
              ),
            ),
          ),
          Text(
              "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
              style: const TextStyle(fontSize: 13, color: AppColor.black))
        ],
      ),
    );
  }
}
