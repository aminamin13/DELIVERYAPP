import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethod extends StatelessWidget {
  const CardPaymentMethod({
    super.key,
    required this.title,
    required this.isActive,
  });
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color:
              isActive == true ? AppColor.secondarycolor : AppColor.thirdColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Text(
        title,
        style: TextStyle(
            color: isActive == true ? Colors.white : AppColor.secondarycolor,
            height: 1,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );
  }
}
