import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomButtonOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        controller.next();
      },
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      color: AppColor.primaryColor,
      textColor: Colors.white,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.primaryColor)),
      child: Text("18".tr,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    );
  }
}
