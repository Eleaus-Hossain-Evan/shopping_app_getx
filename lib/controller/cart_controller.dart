import 'package:get/get.dart';
import 'package:shopping_app_getx/models/cartItem.dart';

class CartController extends GetxController {
  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get TotalAmount {
    var total = 0.0;

    _items.forEach((key, cartItem) {
      total += cartItem.productPrice * cartItem.productQuantity;
    });

    return total;
  }

  void addItem(int productId, double price, String title, int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          productTitle: value.productTitle,
          productQuantity: value.productQuantity + 1,
          productPrice: value.productPrice,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          productTitle: title,
          productQuantity: 1,
          productPrice: price,
        ),
      );
    }
    update();
  }

  void removeitem(int productId) {
    _items.remove(productId);
    update();
  }

  void clear() {
    _items = {};
    update();
  }
}
