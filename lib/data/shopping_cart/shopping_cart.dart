import 'package:product/data/vos/product_vo/product_vo.dart';

class ShoppingCart {
  static List<ProductVO> cartItems = [];

  static void addToCart(ProductVO product) {
    cartItems.add(product);
  }

  static void removeFromCart(int index) {
    cartItems.removeAt(index);
  }

  static List<ProductVO> getCartItems() {
    return cartItems;
  }
}