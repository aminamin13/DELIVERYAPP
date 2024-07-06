import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class TopCartTitle extends StatelessWidget {
  const TopCartTitle({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(
          color: AppColor.thirdColor, borderRadius: BorderRadius.circular(30)),
      child: Text(
        message,
        style: const TextStyle(fontSize: 13, color: Colors.white70),
        textAlign: TextAlign.center,
      ),
    );
  }
}
