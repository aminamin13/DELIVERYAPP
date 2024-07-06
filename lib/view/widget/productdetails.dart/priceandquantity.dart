import 'package:ecommerceapp/controller/productdetails_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceAndQuantity extends GetView<ProductDetailsControllerImp> {
  const PriceAndQuantity({
    required this.onAdd,
    required this.onRemove,
    required this.count,
    required this.price,
    super.key,
  });

  final void Function()? onAdd;
  final void Function()? onRemove;
  final int count;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            alignment: Alignment.center,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.fourthColor),
            ),
            child: Text(
              '$count',
              style: const TextStyle(fontSize: 15),
            )),
        IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
      ]),
      Text("$price \$",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.primaryColor, fontSize: 25)),
    ]);
  }
}
