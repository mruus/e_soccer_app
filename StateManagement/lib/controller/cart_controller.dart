// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';

import '../modules/product_cards.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get totalItems => cartItems.length;

  addProduct(Product cartItem) {
    if (cartItem.isCarted == false) {
      cartItems.add(cartItem);
    }
  }

  removeProduct(Product cartItem) {
    cartItems.removeWhere((element) => element.id == cartItem.id);
  }

  // removeCart(Product cartItem) {
  //   if (cartItem.totalRequest == 0) {
  //     noDuplicatecartItems.removeWhere((item) => item.id == cartItem.id);
  //   }
  //   cartItems.remove(cartItem);
  //   cartItem.totalRequest--;
  // }

  getTotalRequest(Product cartItem) {
    return cartItem.isCarted;
  }
}
