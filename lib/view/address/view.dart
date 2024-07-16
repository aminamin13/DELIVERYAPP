import 'package:ecommerceapp/controller/address/view_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressController controller = Get.put(ViewAddressController());
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
          child: GetBuilder<ViewAddressController>(builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return CardAddress(
                      addressModel: controller.data[index],
                      onPressed: () {
                        controller.deleteAddress(
                            controller.data[index].addressId!.toString());
                      });
                },
              ),
            );
          }),
        ));
  }
}

class CardAddress extends StatelessWidget {
  const CardAddress({
    super.key,
    required this.addressModel,
    this.onPressed,
  });
  final AddressModel addressModel;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(addressModel.addressName!),
      leading: const Icon(Icons.location_on),
      subtitle:
          Text("${addressModel.addressCity!} - ${addressModel.addressStreet!}"),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          )),
    );
  }
}
