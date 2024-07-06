import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/productdetails_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(clipBehavior: Clip.none, children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                    color: AppColor.secondarycolor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    )),
              ),
              Hero(
                tag: "${controller.itemsModel.itemsId}",
                child: CachedNetworkImage(
                  height: 280,
                  fit: BoxFit.fill,
                  imageUrl:
                      "${AppLink.imageitems}/${controller.itemsModel.itemsImage}",
                ),
              ),
            ]);
  }
}