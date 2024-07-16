import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/middleware/mymiddleware.dart';
import 'package:ecommerceapp/view/address/add.dart';
import 'package:ecommerceapp/view/address/add2.dart';
import 'package:ecommerceapp/view/address/edit.dart';
import 'package:ecommerceapp/view/address/view.dart';
import 'package:ecommerceapp/view/orders/archived.dart';
import 'package:ecommerceapp/view/orders/orderdetails.dart';
import 'package:ecommerceapp/view/orders/pending.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/success_resetpasswod.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerceapp/view/screen/auth/signin.dart';
import 'package:ecommerceapp/view/screen/auth/signup.dart';
import 'package:ecommerceapp/view/screen/auth/success_signup.dart';
import 'package:ecommerceapp/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerceapp/view/screen/cart.dart';
import 'package:ecommerceapp/view/screen/checkout.dart';
import 'package:ecommerceapp/view/screen/homescreen.dart';
import 'package:ecommerceapp/view/screen/items.dart';
import 'package:ecommerceapp/view/screen/language.dart';
import 'package:ecommerceapp/view/screen/myfavorite.dart';
import 'package:ecommerceapp/view/screen/notifications.dart';
import 'package:ecommerceapp/view/screen/onboarding.dart';
import 'package:ecommerceapp/view/screen/productdetails.dart';
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

  GetPage(name: AppRoute.productsdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.addressadd2, page: () => const AddressAdd2()),
  GetPage(name: AppRoute.addressedit, page: () => const AddressEdit()),
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.pendingorders, page: () => const OrdersPending()),
  GetPage(name: AppRoute.archivedorders, page: () => const OrdersArchived()),
  GetPage(name: AppRoute.notifications, page: () => const NotificationView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
];
