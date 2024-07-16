import 'package:ecommerceapp/controller/settings_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/imageasset.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
        child: ListView(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              color: AppColor.primaryColor,
              height: Get.width / 2,
            ),
            Positioned(
                top: Get.width / 2.5,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60)),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(AppImageAsset.avatar),
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  title: const Text("Disable Notifications"),
                  trailing: CupertinoSwitch(value: true, onChanged: (value) {}),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.pendingorders);
                  },
                  title: const Text("Orders"),
                  trailing: const Icon(
                    Icons.list_alt_outlined,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.archivedorders);
                  },
                  title: const Text("Archived Orders"),
                  trailing: const Icon(
                    Icons.pan_tool_sharp,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressview);
                  },
                  title: const Text("Address"),
                  trailing: const Icon(
                    Icons.location_on_outlined,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text("About Us"),
                  trailing: const Icon(
                    Icons.help_outline,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text("Contact Us"),
                  trailing: const Icon(
                    Icons.phone_callback_outlined,
                  ),
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: const Text("Logout"),
                  trailing: const Icon(
                    Icons.exit_to_app_outlined,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
