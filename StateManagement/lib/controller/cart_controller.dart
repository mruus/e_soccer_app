import 'package:get/get.dart';
import 'package:getx_state/modules/product_cards.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  var noDuplicatecartItems = <Product>[].obs;
  int get totalItems => cartItems.length;

  addProduct(Product cartItem) {
    if (cartItems.contains(cartItem) == false) {
      noDuplicatecartItems.add(cartItem);
    }
    cartItems.add(cartItem);
    // Update item request
    cartItem.totalRequest++;
  }

  removeCart(Product cartItem) {
    if (cartItem.totalRequest == 0) {
      noDuplicatecartItems.removeWhere((item) => item.id == cartItem.id);
    }
    cartItems.remove(cartItem);
    cartItem.totalRequest--;
  }

  getTotalRequest(Product cartItem) {
    return cartItem.totalRequest;
  }
}
