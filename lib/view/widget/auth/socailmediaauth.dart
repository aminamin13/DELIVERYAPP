import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class SocailMediaAuth extends StatelessWidget {
  const SocailMediaAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 70, top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.backgroundcolor),
            child: Image.asset(
              AppImageAsset.google,
              height: 40,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.backgroundcolor),
            child: Image.asset(
              AppImageAsset.facebook,
              color: Colors.blue[800],
              height: 40,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.backgroundcolor),
            child: Image.asset(
              AppImageAsset.twitter,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
