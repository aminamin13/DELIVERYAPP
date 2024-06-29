import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBottumAppBar extends StatelessWidget {
  const CustomBottumAppBar({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    required this.isactive,
  });
  final String title;
  final void Function()? onPressed;
  final IconData icon;
  final bool? isactive;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isactive == true ? AppColor.primaryColor : AppColor.grey2,
            ),
            Text(title,
                style: TextStyle(
                    color: isactive == true
                        ? AppColor.primaryColor
                        : AppColor.grey2))
          ],
        ));
  }
}
