import 'package:ecommerceapp/controller/auth/ForgetPassword_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/validinput.dart';
import 'package:ecommerceapp/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forget Password",
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
              text: "Forget Password",
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextBodyAuth(
                text:
                    "Please enter your email and we will send you a cod to reset your password"),
            const SizedBox(
              height: 15,
            ),
            Form(
                key: null,
                child: Column(children: [
                  CustomTextFormAuth(
                      hintText: "Enter Your Email",
                      labelText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      mycontroller: controller.email,
                      iconData: Icons.email_outlined,
                       validator: (value) {
                        return validInput(value!, 5, 100, 'email');
                      }),
                ])),
            CustomButtomAuth(
                text: "Continue",
                onPressed: () {
                  controller.goToVerifyCode();
                }),
          ],
        ),
      ),
    );
  }
}
