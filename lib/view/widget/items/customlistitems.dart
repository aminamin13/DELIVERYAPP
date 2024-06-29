import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';

class CustomListItems extends StatelessWidget {
  const CustomListItems({
    super.key,
    required this.itemsModel,
  });
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CachedNetworkImage(
            imageUrl: '${AppLink.imageitems}/${itemsModel.itemsImage}',
            height: 120,
            fit: BoxFit.fill,
          ),
          Text(
            '${itemsModel.itemsName}',
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
                '${itemsModel.itemsPrice} \$',
                style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "sans"),
              ),
              const Icon(Icons.favorite_border_outlined)
            ],
          )
        ]),
      ),
    ));
  }
}
