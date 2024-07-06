import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/myfavorite_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/data/model/myfavoritemodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoriteItems extends GetView<MyfavoriteController> {
  const CustomListFavoriteItems({
    super.key,
    required this.myFavoriteModel,
  });
  final MyFavoriteModel myFavoriteModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CachedNetworkImage(
                imageUrl: '${AppLink.imageitems}/${myFavoriteModel.itemsImage}',
                height: 120,
                fit: BoxFit.fill,
              ),
              Text(
                '${translateDatabase(myFavoriteModel.itemsNameAr, myFavoriteModel.itemsName)}',
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
                    style: TextStyle(color: AppColor.grey2, fontSize: 12),
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
                  Text(
                    '${myFavoriteModel.itemsPrice} \$',
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans"),
                  ),
                  IconButton(
                      onPressed: () {
                        controller
                            .deleteData(myFavoriteModel.favoriteId.toString());
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: AppColor.black,
                      ))
                ],
              )
            ]),
          ),
        ));
  }
}
