import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/success_resetpasswod.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerceapp/view/screen/auth/signin.dart';
import 'package:ecommerceapp/view/screen/auth/signup.dart';
import 'package:ecommerceapp/view/screen/auth/success_signup.dart';
import 'package:ecommerceapp/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerceapp/view/screen/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.SignIn: (context) => const SignIn(),
  AppRoute.onBoarding: (context) => const onBoarding(),
  AppRoute.signup: (context) => const SignUp(),
  AppRoute.forgetpassword: (context) => const ForgetPassword(),
  AppRoute.resetpassword: (context) => const ResetPassword(),
  AppRoute.verifyCode: (context) => const VerifyCode(),
  AppRoute.successresetpassword: (context) => const SuccessResetPassword(),
  AppRoute.successSignup: (context) => const SuccessSignUp(),
  AppRoute.verifycodeSignup: (context) => const VerifyCodeSignUp(),
};
