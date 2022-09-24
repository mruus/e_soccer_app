// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/views/cart_list.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/cart_controller.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    Size size = MediaQuery.of(context).size;
    var getProduct =
        cartController.findProdect(cartController.productID.toString());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 209, 209, 209),
        body: Column(
          children: [
            Container(
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
                        image: NetworkImage(getProduct.thumbnail.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    getProduct.title.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    getProduct.description.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text("--------------------------------"),
                  Text(
                    "**Product Details",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text("--------------------------------"),
                  SizedBox(height: 5),
                  ProductInformation(
                      title: 'Stock', value: getProduct.stock.toString()),
                  ProductInformation(title: 'Brand', value: getProduct.brand),
                  ProductInformation(
                      title: 'Category', value: getProduct.category),
                  ProductInformation(
                      title: 'Rating', value: getProduct.rating.toString()),
                  ProductInformation(
                      title: 'Price',
                      value: "\$${getProduct.price.toString()}"),
                  ProductInformation(
                      title: 'Discount',
                      value: "${getProduct.discountPercentage.toString()}%"),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var i = 0; i < getProduct.images.length; i++)
                              Container(
                                width: size.width / 2,
                                height: 150,
                                margin: EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.0),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        getProduct.images[i].toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(
            () => CartList(),
          ),
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}

class ProductInformation extends StatelessWidget {
  const ProductInformation({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "${title} : ",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          TextSpan(
            text: value.toString(),
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
