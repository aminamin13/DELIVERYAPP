import 'package:ecommerceapp/controller/auth/success_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/view/widget/auth/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatefulWidget {
  const SuccessResetPassword({super.key});

  @override
  State<SuccessResetPassword> createState() => _SuccessResetPasswordState();
}

class _SuccessResetPasswordState extends State<SuccessResetPassword> {
  @override
  Widget build(BuildContext context) {
    final SuccessControllerImp controller = Get.put(SuccessControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Success Reset Password",
        ),
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Center(
            child: Column(
              children: [
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 300),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, child) {
                      return Container(
                        child: Icon(
                          Icons.check_circle_outline,
                          size: value,
                          color: AppColor.primaryColor,
                        ),
                      );
                    }),
                const Text(
                  "Your password has been reset successfully. Please sign in",
                  style: TextStyle(color: AppColor.black, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                SizedBox(
                    width: double.infinity,
                    child: CustomButtomAuth(
                        text: "Go To Sign In",
                        onPressed: () {
                          controller.goToSignIn();
                        })),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
    );
  }
}
