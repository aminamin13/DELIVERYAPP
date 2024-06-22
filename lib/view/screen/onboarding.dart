import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:ecommerceapp/view/widget/onboarding/custombutton.dart';
import 'package:ecommerceapp/view/widget/onboarding/customslider.dart';
import 'package:ecommerceapp/view/widget/onboarding/dotscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class onBoarding extends StatelessWidget {
  const onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingControllerImp controller = Get.put(OnboardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const CustomDotsControllerOnBoarding(),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomButtonOnBoarding(),
                    TextButton(
                        onPressed: () {
                          controller.toSignIn();
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
