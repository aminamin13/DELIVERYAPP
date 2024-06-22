import 'package:ecommerceapp/controller/auth/signup_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/validinput.dart';
import 'package:ecommerceapp/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceapp/view/widget/auth/haveaccountcheck.dart';
import 'package:ecommerceapp/view/widget/auth/socailmediaauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () {
        return SignUpControllerImp();
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
        ),
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: GetBuilder<SignUpControllerImp>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: ListView(
            children: [
              const CustomTextTitleAuth(
                text: "Complete Profile",
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextBodyAuth(
                  text: "Complete your details or continue with social media"),
              const SizedBox(
                height: 15,
              ),
              Form(
                  key: controller.formstate1,
                  child: Column(children: [
                    CustomTextFormAuth(
                        hintText: "Enter Your Username",
                        labelText: "Username",
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        focusNode: controller.usernameFocusNode,
                        mycontroller: controller.username,
                        validator: (value) {
                          controller.usernameFocusNode.requestFocus();
                          return validInput(value!, 5, 100, 'username');
                        },
                        iconData: Icons.person_2_outlined),
                    CustomTextFormAuth(
                        hintText: "Enter Your Phone Number",
                        labelText: "Phone",
                        keyboardType: TextInputType.phone,
                        obscureText: false,
                        mycontroller: controller.phone,
                        iconData: Icons.phone_android_outlined,
                        validator: (value) {
                          return validInput(value!, 6, 25, 'phone');
                        }),
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
                    CustomTextFormAuth(
                        hintText: "Enter Your Password",
                        labelText: "Password",
                        mycontroller: controller.password,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        iconData: Icons.lock_clock_outlined,
                        validator: (value) {
                          return validInput(value!, 6, 30, 'password');
                        })
                  ])),
              CustomButtomAuth(
                  text: "Continue",
                  onPressed: () {
                    controller.signUp();
                  }),
              const SizedBox(
                height: 15,
              ),
              const SocailMediaAuth(),
              HaveAccountCheck(
                  text: "Already have an account ? ",
                  actionText: "Sign In",
                  onPressed: () {
                    controller.goToSignIn();
                  }),
            ],
          ),
        );
      }),
    );
  }
}
