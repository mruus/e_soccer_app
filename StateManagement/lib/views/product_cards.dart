// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last, avoid_print, prefer_const_constructors_in_immutables, unrelated_type_equality_checks, prefer_const_literals_to_create_immutables, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/views/cart_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../controller/cart_controller.dart';
import '../controller/products_controller.dart';
import '../modules/product_cards.dart';

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
            Container(
              width: size.width,
              height: 50,
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 8,
                bottom: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.0),
                // border: Border(
                //   bottom: BorderSide(color: Colors.black, width: 2.0),
                // ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 5,
                        right: 6,
                        child: GetX<CartController>(builder: (controller) {
                          return Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: controller.totalItems != 0
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                controller.totalItems > 9
                                    ? "9+"
                                    : controller.totalItems.toString(),
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => CartList()),
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GetX<ProductController>(
                builder: (controller) {
                  return shppingProducts.products.length != 0
                      ? ListView.builder(
                          itemCount: shppingProducts.products.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => Container(
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
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.black,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(controller
                                              .products[index].thumbnail
                                              .toString()),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      controller.products[index].title
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
                                      controller.products[index].description
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
                                      children: [
                                        ElevatedButton(
                                          onPressed: controller.products[index]
                                                      .isCarted ==
                                                  true
                                              ? null
                                              : () {
                                                  cartController.addProduct(
                                                      controller
                                                          .products[index]);
                                                  controller
                                                      .products[index].isCarted
                                                      .toggle();
                                                },
                                          child: Text("Add To Cart"),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: controller
                                                        .products[index]
                                                        .isCarted ==
                                                    false
                                                ? Colors.black
                                                : Colors.white,
                                            fixedSize: Size(250, 50),
                                          ),
                                        ),
                                        OutlinedButton(
                                          onPressed: null,
                                          child: Icon(
                                            controller.products[index]
                                                        .isCarted ==
                                                    false
                                                ? Icons.cancel_outlined
                                                : Icons.check_outlined,
                                            color: controller.products[index]
                                                        .isCarted ==
                                                    false
                                                ? Colors.red
                                                : Colors.green,
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            fixedSize: Size(70, 50),
                                            side: BorderSide(
                                              color: controller.products[index]
                                                          .isCarted ==
                                                      false
                                                  ? Colors.red
                                                  : Colors.green,
                                            ),
                                          ),
                                        ),
                                        // Icon(Icons.heart_broken_outlined),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: LoadingIndicator(
                                indicatorType: Indicator.ballClipRotateMultiple,
                                colors: [Colors.black],
                              ),
                            ),
                          ),
                        );
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

class CartBoxItem extends StatelessWidget {
  const CartBoxItem({
    Key? key,
    required this.size,
    required this.title,
    required this.description,
    required this.imageURL,
    required this.product,
  }) : super(key: key);

  final Size size;
  final String title, description, imageURL;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Container(
      width: size.width,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
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
                image: NetworkImage(imageURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ElevatedButton(
                onPressed: product.isCarted == true
                    ? null
                    : () {
                        cartController.addProduct(product);
                        product.isCarted.toggle();
                      },
                child: Text("Add To Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      product.isCarted == false ? Colors.black : Colors.white,
                  fixedSize: Size(250, 50),
                ),
              ),
              OutlinedButton(
                onPressed: null,
                child: Icon(
                  product.isCarted == false
                      ? Icons.cancel_outlined
                      : Icons.check_outlined,
                  color: product.isCarted == false ? Colors.red : Colors.green,
                ),
                style: OutlinedButton.styleFrom(
                    fixedSize: Size(70, 50),
                    side: BorderSide(
                      color:
                          product.isCarted == false ? Colors.red : Colors.green,
                    )),
              ),
              // Icon(Icons.heart_broken_outlined),
            ],
          ),
        ],
      ),
    );
  }
}
