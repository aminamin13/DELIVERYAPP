import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardDeliveryType extends StatelessWidget {
  const CardDeliveryType(
      {super.key,
      required this.imageName,
      required this.title,
      required this.isActive});
  final String imageName;
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            color: isActive == true ? AppColor.secondarycolor : Colors.white,
            border: Border.all(color: AppColor.primaryColor)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(imageName,
              width: 60, color: isActive == true ? Colors.white : null),
          Text(title,
              style: TextStyle(
                  color:
                      isActive == true ? Colors.white : AppColor.primaryColor)),
        ]));
  }
}
