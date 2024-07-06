import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/imageasset.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemCartList extends StatelessWidget {
   CustomItemCartList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,required this.onPressedAdd, required this.onPressedRemove,
  });
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onPressedAdd;
  final void Function()? onPressedRemove;
  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageitems}/$imagename"),
            ),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: const TextStyle(fontSize: 20)),
                subtitle: Text("$price \$",
                    style: const TextStyle(
                        fontSize: 20, color: AppColor.primaryColor)),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: IconButton(
                    onPressed: onPressedAdd,
                    icon: const Icon(Icons.add),
                  ),
                ),
                SizedBox(
                    height: 30,
                    child: Text(count,
                        style: const TextStyle(fontFamily: "sans"))),
                SizedBox(
                  height: 30,
                  child: IconButton(
                    onPressed: onPressedRemove,
                    icon: const Icon(Icons.remove),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
