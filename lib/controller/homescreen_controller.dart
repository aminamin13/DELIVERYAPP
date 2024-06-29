import 'package:ecommerceapp/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreeControllerImp extends HomeScreenController {
  int currentPage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Settings"),
        )
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Profile"),
        )
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Favourite"),
        )
      ],
    ),
  ];

  List titlebottomappbar = [
    "Home",
    "Settings",
    "Profile",
    "Favourite",
  ];

  List iconbottomappbar = [
    Icons.home,
    Icons.settings,
    Icons.person,
    Icons.favorite,
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
