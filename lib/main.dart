import 'package:ecommerceapp/binding/initialbindin.dart';
import 'package:ecommerceapp/core/localization/changelocal.dart';
import 'package:ecommerceapp/core/localization/translation.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
        title: 'Flutter Demo',
        translations: MyTranslation(),
        locale: controller.langauge,
        theme: controller.appTheme ,
        debugShowCheckedModeBanner: false,
        getPages: routes,
        initialBinding: InitialBindings(),
        );
        
  }
}
