import 'package:ecommerceapp/controller/auth/ResetPassword_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/validinput.dart';
import 'package:ecommerceapp/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reset Password",
        ),
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            const CustomTextTitleAuth(
              text: "Add New Password",
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextBodyAuth(
                text: "Please Enter Your New Password To continue"),
            const SizedBox(
              height: 15,
            ),
            Form(
                key: null,
                child: Column(children: [
                  CustomTextFormAuth(
                      hintText: "Enter Your New Password",
                      labelText: "Password",
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      mycontroller: controller.password,
                      iconData: Icons.lock_clock_outlined,
                      validator: (value) {
                        return validInput(value!, 6, 100, 'password');
                      }),
                  CustomTextFormAuth(
                      hintText: "Re-Enter Your New Password",
                      labelText: "Password",
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      mycontroller: controller.repassword,
                      iconData: Icons.lock_clock_outlined,
                      validator: (value) {
                        return validInput(value!, 6, 100, 'password');
                      }),
                ])),
            CustomButtomAuth(
                text: "Continue",
                onPressed: () {
                  controller.goToSuccessResetPassword();
                }),
          ],
        ),
      ),
    );
  }
}
