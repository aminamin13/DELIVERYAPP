import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomSliderOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomSliderOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) {
          return Column(children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              onBoardingList[i].title!,
              style: const TextStyle(
                fontSize: 20,
                color: AppColor.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              onBoardingList[i].image!,
              width: 200,
              height: 230,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                  textAlign: TextAlign.center,
                  onBoardingList[i].body!,
                  style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                      height: 2)),
            ),
          ]);
        });
  }
}
