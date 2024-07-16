import 'package:ecommerceapp/view/screen/home.dart';
import 'package:ecommerceapp/view/screen/notifications.dart';
import 'package:ecommerceapp/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreeControllerImp extends HomeScreenController {
  int currentPage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const NotificationView(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Profile"),
        )
      ],
    ),
    const Settings()
  ];

  List bottomappbar = [
    {
      "title": "Home",
      "icon": Icons.home,
    },
    {
      "title": "Notification",
      "icon": Icons.notifications,
    },
    {
      "title": "Profile",
      "icon": Icons.person,
    },
    {
      "title": "Settings",
      "icon": Icons.settings,
    }
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
