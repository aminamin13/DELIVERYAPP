import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Address"),
        ),
        floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              Get.toNamed(AppRoute.addressadd);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        body: Container(
          child: ListView(
            children: const [],
          ),
        ));
  }
}
