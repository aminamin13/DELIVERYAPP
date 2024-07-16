import 'package:ecommerceapp/controller/address/add2_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAdd2 extends StatelessWidget {
  const AddressAdd2({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddress2Controller controller = Get.put(AddAddress2Controller());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Address Details"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<AddAddress2Controller>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(children: [
                    CustomTextFormAuth(
                        hintText: "City",
                        labelText: "City",
                        mycontroller: controller.city,
                        iconData: Icons.location_city_outlined,
                        validator: (val) {
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        obscureText: false),
                    CustomTextFormAuth(
                        hintText: "Street",
                        labelText: "Street",
                        mycontroller: controller.street,
                        iconData: Icons.streetview,
                        validator: (val) {
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        obscureText: false),
                    CustomTextFormAuth(
                        hintText: "Name",
                        labelText: "Name",
                        mycontroller: controller.name,
                        iconData: Icons.near_me,
                        validator: (val) {
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        obscureText: false),
                    CustomButtomAuth(
                        text: "Next",
                        onPressed: ()  {
                           controller.addDetails();
                        }),
                  ]),
                );
              }
            )));
  }
}
