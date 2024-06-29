import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/middleware/mymiddleware.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/success_resetpasswod.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerceapp/view/screen/auth/signin.dart';
import 'package:ecommerceapp/view/screen/auth/signup.dart';
import 'package:ecommerceapp/view/screen/auth/success_signup.dart';
import 'package:ecommerceapp/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerceapp/view/screen/items.dart';
import 'package:ecommerceapp/view/screen/homescreen.dart';
import 'package:ecommerceapp/view/screen/language.dart';
import 'package:ecommerceapp/view/screen/onboarding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Languages(), middlewares: [
    MyMiddleWare(),
  ]), // this used to start directly from the sign in if the user is already logged in

  // GetPage(name: "/", page: () => const Test()),
  GetPage(name: AppRoute.SignIn, page: () => const SignIn()),
  GetPage(name: AppRoute.onBoarding, page: () => const onBoarding()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.resetpassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(
      name: AppRoute.successresetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignup, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.homescreen, page: () => const HomeScreen()),
  GetPage(
      name: AppRoute.verifycodeSignup, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.items, page: () => const ItemsPage()),

];
