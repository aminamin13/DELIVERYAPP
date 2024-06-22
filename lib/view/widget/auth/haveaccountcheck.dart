import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class HaveAccountCheck extends StatelessWidget {
  const HaveAccountCheck({
    super.key, required this.text, required this.actionText, this.onPressed,
  });
  final String text;
  final String actionText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(text),
        TextButton(
            onPressed: onPressed,
            child:  Text(
              actionText,
              style: TextStyle(color: AppColor.primaryColor),
            ))
      ],
    );
  }
}
