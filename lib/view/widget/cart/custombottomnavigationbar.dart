import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/view/widget/cart/custombuttoncart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBarCart extends StatelessWidget {
  const CustomBottomNavigationBarCart({
    super.key,
    required this.price,
    required this.shipping,
    required this.total,
  });
  final int price;
  final String shipping;
  final int total;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text("Price",
                    style: Theme.of(context).textTheme.bodyMedium)),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text('$price' " \$",
                    style: Theme.of(context).textTheme.bodyMedium)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text("Shipping",
                    style: Theme.of(context).textTheme.bodyMedium)),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text('$shipping' " \$",
                    style: Theme.of(context).textTheme.bodyMedium)),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text("Total",
                    style: Theme.of(context).textTheme.bodyMedium)),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text('$total' " \$",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold))),
          ],
        ),
        CustomButtonCart(textbutton: "Order Now", onPressed: () {}),
        CustomButtonCart(
            textbutton: "Add More Items",
            onPressed: () {
              Get.offNamed(AppRoute.homescreen);
            }),
      ],
    ));
  }
}
