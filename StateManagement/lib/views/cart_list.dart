// ignore_for_file: prefer_const_constructors, ignore_for_file: sort_child_properties_last, prefer_is_empty, unrelated_type_equality_checks, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/views/product_cards.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/cart_controller.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 209, 209, 209),
        body: Column(
          children: [
            Expanded(
              child: GetX<CartController>(
                builder: (controller) {
                  return cartController.cartItems.length != 0
                      ? ListView.builder(
                          itemCount: cartController.cartItems.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: size.width,
                              padding: EdgeInsets.all(15.0),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3.0),
                                // border: Border(
                                //   bottom: BorderSide(color: Colors.black, width: 2.0),
                                // ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: size.width,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(3.0),
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.black,
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(controller
                                            .cartItems[index].thumbnail
                                            .toString()),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    controller.cartItems[index].title
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    controller.cartItems[index].description
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          controller.cartItems[index].isCarted
                                              .toggle();
                                          cartController.removeProduct(
                                              controller.cartItems[index]);
                                        },
                                        child: Text("Remove From Cart"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          fixedSize: Size(324, 50),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          })
                      : Center(child: Text("No Carts Available"));
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(
            () => ProductApplication(),
          ),
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
