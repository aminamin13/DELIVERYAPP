import 'package:ecommerceapp/controller/checkout_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/imageasset.dart';
import 'package:ecommerceapp/view/widget/checkout/carddeliverytype.dart';
import 'package:ecommerceapp/view/widget/checkout/cardpaymentmethod.dart';
import 'package:ecommerceapp/view/widget/checkout/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: MaterialButton(
          color: AppColor.primaryColor,
          textColor: Colors.white,
          onPressed: () {
            controller.checkout();
          },
          child: const Text(
            "Checkout",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Checkout",
        ),
      ),
      body: GetBuilder<CheckoutController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(children: [
                  const Text("Choose Your Payment Method"),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        controller.choosePaymentMethod("0");
                      },
                      child: CardPaymentMethod(
                          title: "Cash On Delivery",
                          isActive:
                              controller.paymentMethod == "0" ? true : false)),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        controller.choosePaymentMethod("1");
                      },
                      child: CardPaymentMethod(
                          title: "Payment Card",
                          isActive:
                              controller.paymentMethod == "1" ? true : false)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Choose Delivery Type"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.chooseDeliveryType("0"); // delivery
                        },
                        child: CardDeliveryType(
                            imageName: AppImageAsset.deliveryImage2,
                            title: "Delivery",
                            isActive:
                                controller.deliveryType == "0" ? true : false),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.chooseDeliveryType("1");
                        },
                        child: CardDeliveryType(
                            imageName: AppImageAsset.drivethruImage,
                            title: "Drive Thru",
                            isActive:
                                controller.deliveryType == "1" // drivethru
                                    ? true
                                    : false),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  controller.deliveryType == "0"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Choose Shipping Address"),
                            ...List.generate(
                              controller.data.length,
                              (index) {
                                return InkWell(
                                  onTap: () {
                                    controller.chooseShippingAddress(controller
                                        .data[index].addressId
                                        .toString());
                                  },
                                  child: CardShippingAddress(
                                    title: controller.data[index].addressName!,
                                    body:
                                        '${controller.data[index].addressCity!} - ${controller.data[index].addressStreet!}',
                                    isActive: controller.addressId ==
                                            controller.data[index].addressId
                                                .toString()
                                        ? true
                                        : false,
                                  ),
                                );
                              },
                            )
                          ],
                        )
                      : Container(),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ));
      }),
    );
  }
}
