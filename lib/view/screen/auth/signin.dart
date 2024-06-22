import 'package:ecommerceapp/controller/auth/signin_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/validinput.dart';
import 'package:ecommerceapp/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceapp/view/widget/auth/haveaccountcheck.dart';
import 'package:ecommerceapp/view/widget/auth/logoauth.dart';
import 'package:ecommerceapp/view/widget/auth/socailmediaauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInControllerImp controller = Get.put(SignInControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "10".tr,
        ),
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            const LogoAuth(),
            CustomTextTitleAuth(
              text: "11".tr,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextBodyAuth(text: "12".tr),
            const SizedBox(
              height: 15,
            ),
            Form(
                key: controller.formstate,
                child: Column(children: [
                  CustomTextFormAuth(
                      hintText: "13".tr,
                      labelText: "14".tr,
                      mycontroller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      iconData: Icons.email_outlined,
                      validator: (value) {
                        return validInput(value!, 5, 100, 'email');
                      }),
                  CustomTextFormAuth(
                      hintText: "15".tr,
                      labelText: "16".tr,
                      mycontroller: controller.password,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      iconData: Icons.lock_clock_outlined,
                      validator: (value) {
                        return validInput(value!, 6, 30, 'password');
                      })
                ])),
            InkWell(
              onTap: () {
                controller.goToForgetPassword();
              },
              child: Text(
                "17".tr,
                textAlign: TextAlign.end,
              ),
            ),
            CustomButtomAuth(
                text: "18".tr,
                onPressed: () {
                  controller.signIn();
                }),
            const SizedBox(
              height: 15,
            ),
            const SocailMediaAuth(),
            HaveAccountCheck(
                text: "19".tr,
                actionText: "20".tr,
                onPressed: () {
                  controller.goToSignUp();
                }),
          ],
        ),
      ),
    );
  }
}
