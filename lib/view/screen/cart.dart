import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/view/widget/cart/custombottomnavigationbar.dart';
import 'package:ecommerceapp/view/widget/cart/customitemcardlist.dart';
import 'package:ecommerceapp/view/widget/cart/topcarttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (controller) {
        return CustomBottomNavigationBarCart(
          controllerCoupon: controller.controllerCoupon,
          onPressedApply: () {
            controller.checkCoupon();
          },
          price: cartController.priceorders,
          discount: int.parse("${cartController.discountCoupon}"),
          total: cartController.getTotalPrice(),
          shipping: 0,
        );
      }),
      body: GetBuilder<CartController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TopCartTitle(
                      message:
                          "Your have ${cartController.totalcountitems} items in your cart",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ...List.generate(cartController.data.length, (index) {
                      return CustomItemCartList(
                        name: cartController.data[index].itemsName!,
                        price:
                            cartController.data[index].itemsprice!.toString(),
                        count:
                            cartController.data[index].countitems!.toString(),
                        imagename: cartController.data[index].itemsImage!,
                        onPressedAdd: () async {
                          await cartController.addCart(
                              cartController.data[index].itemsId!.toString());
                          cartController.refreshPage();
                        },
                        onPressedRemove: () async {
                          await cartController.removeCart(
                              cartController.data[index].itemsId!.toString());
                          cartController.refreshPage();
                        },
                      );
                    }),
                  ],
                ),
              ))),
    );
  }
}
