import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  const CustomButtonLang({
    super.key,
    required this.textbutton,
    this.onPressed,
  });

  final String textbutton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.black,
        child: Text(
          textbutton,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ));
  }
}
