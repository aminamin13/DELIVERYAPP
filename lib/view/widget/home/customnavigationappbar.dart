import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/view/widget/home/custombuttomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreeControllerImp>(builder: (controller) {
      return BottomAppBar(
          height: 70,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(children: [
            ...List.generate(
              controller.listPage.length + 1,
              (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomBottumAppBar(
                        title: controller.titlebottomappbar[i],
                        icon: controller.iconbottomappbar[i],
                        isactive: controller.currentPage == i ? true : false,
                        onPressed: () {
                          controller.changePage(i);
                        });
              },
            )
          ]));
    });
  }
}
