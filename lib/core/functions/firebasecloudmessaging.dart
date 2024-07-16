import 'package:ecommerceapp/controller/notification_controller.dart';
import 'package:ecommerceapp/controller/orders/pending_controller.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((RemoteMessage remotemessage) {
    print("=====================Notification received=====================");
    print(remotemessage.notification!.title);
    print(remotemessage.notification!.body);
    FlutterRingtonePlayer().playNotification();

    Get.snackbar(
        remotemessage.notification!.title!, remotemessage.notification!.body!);

    refreshPageNotification(remotemessage.data);
  });
}

refreshPageNotification(data) {
  print("========================Page id");
  print(data['pageid']);
  print("========================Page name");

  print("=================current root");

  print(Get.currentRoute);

  if (Get.currentRoute == AppRoute.pendingorders &&
      data["pagename"] == "refreshorderpending") {
    PendingOrderController controller = Get.find();

    controller.refreshOrder();
  }
}





//another way


// firebase+ stream(snapchat , check firebase course)

// Socket io

// Notification Refresh