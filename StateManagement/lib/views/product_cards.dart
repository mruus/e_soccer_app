// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/controller/cart_controller.dart';
import 'package:getx_state/controller/products_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductApplication extends StatelessWidget {
  ProductApplication({super.key});

  final shppingProducts = Get.put(ProductController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 209, 209, 209),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GetX<ProductController>(
                builder: (controller) {
                  return ListView.builder(
                      itemCount: shppingProducts.products.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(
                            top: 20,
                            left: 8,
                            right: 8,
                            bottom: 10,
                          ),
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.blue,
                                  child: Center(
                                    child: Text(
                                      (index + 1).toString(),
                                      style: GoogleFonts.anton(
                                        textStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    "${controller.products[index].title}",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    controller.products[index].description
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          // Add to cart
                                          cartController.addProduct(
                                              controller.products[index]);
                                        },
                                        child: Text("Add To Cart"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (controller.products[index]
                                                  .totalRequest ==
                                              0) {
                                            print(
                                                "Product of ${controller.products[index].title} has zero requests");
                                          } else {
                                            cartController.removeCart(
                                                controller.products[index]);
                                          }
                                        },
                                        child: Text("Remove From Cart"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: null,
          label: GetX<CartController>(builder: (controller) {
            return Text("Total Carts: ${controller.totalItems}");
          }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
