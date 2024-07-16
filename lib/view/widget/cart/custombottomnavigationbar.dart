import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/view/widget/cart/custombuttoncart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBarCart extends GetView<CartController> {
  const CustomBottomNavigationBarCart({
    super.key,
    required this.price,
    required this.discount,
    required this.total,
    required this.controllerCoupon,
    required this.onPressedApply,
    required this.shipping,
  });
  final double price;
  final int discount;
  final double total;
  final int shipping;
  final TextEditingController? controllerCoupon;
  final void Function()? onPressedApply;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(builder: (controller) {
            return controller.couponName == null
                ? Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(children: [
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllerCoupon,
                            decoration: InputDecoration(
                              hintText: "Enter coupon code",
                              hintStyle: const TextStyle(fontSize: 15),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: CustomButtonCart(
                              textbutton: "Apply", onPressed: onPressedApply))
                    ]))
                : Container(
                    child: Text(
                    "Coupon: ${controller.couponName!} is applied",
                    style: const TextStyle(
                        fontSize: 15,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ));
          }),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.primaryColor, width: 1)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text("Price",
                            style: Theme.of(context).textTheme.bodyMedium)),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text('$price' " \$",
                            style: Theme.of(context).textTheme.bodyMedium)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text("Discount",
                            style: Theme.of(context).textTheme.bodyMedium)),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text('$discount' " %",
                            style: Theme.of(context).textTheme.bodyMedium)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text("Shipping",
                            style: Theme.of(context).textTheme.bodyMedium)),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text('$shipping' " %",
                            style: Theme.of(context).textTheme.bodyMedium)),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text("Total",
                            style: Theme.of(context).textTheme.bodyMedium)),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text('$total' " \$",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold))),
                  ],
                ),
              ],
            ),
          ),
          CustomButtonCart(
              textbutton: "Order Now",
              onPressed: () {
                controller.goToPageCheckout();
              }),
          CustomButtonCart(
              textbutton: "Add More Items",
              onPressed: () {
                Get.offNamed(AppRoute.homescreen);
              }),
        ],
      ),
    );
  }
}
