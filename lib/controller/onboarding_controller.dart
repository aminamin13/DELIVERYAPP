import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged(int index);
  toSignIn();
}

class OnboardingControllerImp extends OnboardingController {
  int currentPage = 0;

  late PageController pageController;

  MyServices myServices = Get.find();

  @override
  toSignIn() {
        myServices.sharedPreferences.setString("onboarding", "1");

    Get.offNamed(AppRoute.SignIn);
  }

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
          myServices.sharedPreferences.setString("onboarding", "1");


      Get.offAllNamed(AppRoute.SignIn);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController();
  }
}
