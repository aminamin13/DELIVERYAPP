import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/localization/changelocal.dart';
import 'package:ecommerceapp/view/widget/onboarding/language/custombuttomlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Languages extends GetView<LocalController> {
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: 20,
              ),
              CustomButtonLang(
                textbutton: "2".tr,
                onPressed: () {
                  controller.changeLang('ar');
                  Get.toNamed(AppRoute.onBoarding);
                },
              ),
              CustomButtonLang(
                textbutton: "3".tr,
                onPressed: () {
                  controller.changeLang('en');
                  Get.toNamed(AppRoute.onBoarding);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
