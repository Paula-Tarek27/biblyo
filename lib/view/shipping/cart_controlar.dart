import 'package:get/get.dart';
import '../../common/message.dart';
import 'cart.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addToCart(CartItem item) {
    cartItems.add(item);
    successMessage("Book added to Library");
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
    successMessage("Book removed from Library");
  }
}
