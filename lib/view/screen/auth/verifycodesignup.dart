import 'package:ecommerceapp/controller/auth/verifycodesignup_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/imageasset.dart';
import 'package:ecommerceapp/view/widget/auth/customtextauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controller =
        Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Verification Code",
        ),
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller) {
        return HandlingDataRequest(statusRequest: controller.statusRequest, widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView(
                  children: [
                    const CustomTextTitleAuth(
                      text: "OTP Verification",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextBodyAuth(
                        text:
                            "Please enter the 5 digit code sent to your email address"),
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                        key: null,
                        child: Column(children: [
                          OtpTextField(
                              fieldWidth: 50,
                              borderRadius: BorderRadius.circular(20),
                              numberOfFields: 5,
                              borderColor: const Color(0xFF512DA8),
                              //set to true to show as box or false to show as dash
                              showFieldAsBox: true,
                              //runs when a code is typed in
                              onCodeChanged: (String code) {
                                //handle validation or checks here
                              },
                              //runs when every textfield is filled
                              onSubmit: (String verificationCode) {
                                controller.goToSuccessSignUp(verificationCode);
                              })
                          // end onSubmit
                        ])),
                  ],
                ),
              ));
      }),
    );
  }
}
