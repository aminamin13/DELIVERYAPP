import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardShippingAddress extends StatelessWidget {
  const CardShippingAddress(
      {super.key,
      required this.title,
      required this.body,
      required this.isActive});
  final String title;
  final String body;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: isActive == true ? AppColor.secondarycolor : null,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ListTile(
          title: Text(title,
              style: TextStyle(
                  color: isActive == true ? Colors.white : Colors.black)),
          subtitle: Text(body,
              style: TextStyle(
                  color: isActive == true ? Colors.white : Colors.black)),
        ));
  }
}
