// ignore_for_file: unrelated_type_equality_checks, avoid_print

import 'package:get/get.dart';

import '../modules/product_cards.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get totalItems => cartItems.length;
  final productID = 'None'.obs;

  addProduct(Product cartItem) {
    if (cartItem.isCarted == false) {
      cartItems.add(cartItem);
    }
  }

  removeProduct(Product cartItem) {
    cartItems.removeWhere((element) => element.id == cartItem.id);
  }

  findProdect(String id) {
    List<Product> product =
        cartItems.where((element) => element.id == int.parse(id)).toList();
    return product[0];
  }

  getTotalRequest(Product cartItem) {
    return cartItem.isCarted;
  }
}
