import 'package:ecommerceapp/controller/notification_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: GetBuilder<NotificationController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(controller.data[index].notificationTitle!),
                      subtitle: Text(controller.data[index].notificationBody!),
                      trailing: Text(
                        Jiffy.parse(
                                controller.data[index].notificationDatetime!)
                            .fromNow(),
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ));
        },
      ),
    );
  }
}
