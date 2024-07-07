import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/imageasset.dart';
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  const CustomListItems({
    super.key,
    required this.itemsModel,
  });
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Stack(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl:
                              '${AppLink.imageitems}/${itemsModel.itemsImage}',
                          height: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        '${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}',
                        style: const TextStyle(
                            color: AppColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Rating 3.5",
                            style:
                                TextStyle(color: AppColor.grey2, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            height: 20,
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              children: [
                                ...List.generate(
                                  5,
                                  (index) {
                                    return const Icon(
                                      Icons.star,
                                      color: AppColor.primaryColor,
                                      size: 15,
                                    );
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${itemsModel.itemsdiscountprice} \$',
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sans"),
                              ),
                            ],
                          ),
                          GetBuilder<FavoriteController>(builder: (controller) {
                            return IconButton(
                                onPressed: () {
                                  if (controller
                                          .isFavorite[itemsModel.itemsId] ==
                                      1) {
                                    controller.setFavorite(
                                        itemsModel.itemsId, 0);
                                    controller.removeFavorite(
                                        itemsModel.itemsId.toString());
                                  } else {
                                    controller.setFavorite(
                                        itemsModel.itemsId, 1);
                                    controller.addFavorite(
                                        itemsModel.itemsId.toString());
                                  }
                                },
                                icon: Icon(
                                  controller.isFavorite[itemsModel.itemsId] == 1
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: AppColor.primaryColor,
                                ));
                          })
                        ],
                      )
                    ]),
              ),
            ),
            itemsModel.itemsDiscount == 0
                ? const SizedBox()
                : Positioned(
                    top: 4,
                    left: 4,
                    child: Image.asset(
                      AppImageAsset.salelogo,
                      height: 40,
                    ),
                  ),
          ],
        ));
  }
}
