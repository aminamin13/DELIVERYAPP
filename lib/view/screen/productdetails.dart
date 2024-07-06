import 'package:ecommerceapp/controller/productdetails_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/view/widget/productdetails.dart/priceandquantity.dart';
import 'package:ecommerceapp/view/widget/productdetails.dart/subitemlist.dart';
import 'package:ecommerceapp/view/widget/productdetails.dart/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());

    return Scaffold(
      bottomNavigationBar: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.secondarycolor,
        ),
        child: MaterialButton(
          onPressed: () {
            Get.offAndToNamed(AppRoute.cart);
          },
          child: const Text(
            "Go To Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView(
                children: [
                  const TopProductPageDetails(),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${translateDatabase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: AppColor.fourthColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        PriceAndQuantity(
                          onAdd: () {
                            controller.add();
                          },
                          onRemove: () {
                            controller.remove();
                          },
                          count: controller.countItems,
                          price: "${controller.itemsModel.itemsPrice}",
                        ),
                        Text(
                          "${translateDatabase('${controller.itemsModel.itemsDescAr} ${controller.itemsModel.itemsDescAr} ${controller.itemsModel.itemsDescAr}', '${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc}')}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColor.grey2),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Color",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: AppColor.fourthColor),
                        ),
                        const SizedBox(height: 10),
                        const SubItemList()
                      ],
                    ),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
